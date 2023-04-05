#
# The VMware NSX-T provider to connect to the NSX
# REST API running on the NSX-T Manager cluster.
#
provider "nsxt" {
  host                  = var.nsx_manager
  username              = var.nsx_username
  password              = var.nsx_password
  allow_unverified_ssl  = true
  max_retries           = 2
}

######################################################################################################################################
#                                                                                                                                    #
# Tier-0 Gateways                                                                                                                    #
#                                                                                                                                    #
######################################################################################################################################
resource "nsxt_policy_tier0_gateway" "tier0" {
  for_each                  = var.tier0_gateway
  display_name              = each.value["display_name"]
  description               = each.value["description"]
  edge_cluster_path         = data.nsxt_policy_edge_cluster.edge_cluster-01.path
  ha_mode                   = each.value["ha_mode"]
  enable_firewall           = each.value["enable_firewall"]
  failover_mode             = each.value["failover_mode"]
    bgp_config {
    local_as_num            = each.value["local_as_number"]
  }
}

######################################################################################################################################
#                                                                                                                                    #
# Tier-0 Gateway Interfaces                                                                                                          #
#                                                                                                                                    #
######################################################################################################################################
resource "nsxt_policy_tier0_gateway_interface" "interface" {
  for_each                  = var.tier0_gateway_interface
  display_name              = each.value["display_name"]
  description               = each.value["description"]
  type                      = each.value["type"]
  edge_node_path            = data.nsxt_policy_edge_node.node1.path
  gateway_path              = nsxt_policy_tier0_gateway.tier0[each.value.gateway].path
  segment_path              = nsxt_policy_vlan_segment.segment[each.value.segment].path
  subnets                   = each.value["subnets"]
}

######################################################################################################################################
#                                                                                                                                    #
# BGP Neighbors                                                                                                                      #
#                                                                                                                                    #
######################################################################################################################################
resource "nsxt_policy_bgp_neighbor" "neighbor" {
  for_each                  = var.bgp_neighbor
  display_name              = each.value["display_name"]
  description               = each.value["description"]
  bgp_path                  = nsxt_policy_tier0_gateway.tier0.bgp_config.path
  allow_as_in               = each.value["allow_as_in"]
  graceful_restart_mode     = each.value["graceful_restart_mode"]
  hold_down_time            = each.value["hold_down_timer"]
  keep_alive_time           = each.value["keep_alive_timer"]
  neighbor_address          = each.value["neighbor_address"]
  remote_as_num             = each.value["remote_as_num"]
  source_addresses          = nsxt_policy_tier0_gateway_interface.interface[each.value.source_interface]
}

######################################################################################################################################
#                                                                                                                                    #
# Tier-1 Gateways                                                                                                                    #
#                                                                                                                                    #
######################################################################################################################################
resource "nsxt_policy_tier1_gateway" "tier1" {
  for_each                  = var.tier1_gateway
  display_name              = each.value["display_name"]
  description               = each.value["description"]
  edge_cluster_path         = data.nsxt_policy_edge_cluster.edge_cluster-01.path
  tier0_path                = nsxt_policy_tier0_gateway.tier0[each.value.tier-0].path
  enable_standby_relocation = each.value["enable_standby_relocation"]
  enable_firewall           = each.value["enable_firewall"]
  failover_mode             = each.value["failover_mode"]
  route_advertisement_types = [
    "TIER1_CONNECTED"]
}


######################################################################################################################################
#                                                                                                                                    #
# Overlay Segments                                                                                                                           #
#                                                                                                                                    #
######################################################################################################################################

resource "nsxt_policy_segment" "segment" {
  for_each            = var.nsx_segment
  display_name        = each.value["display_name"]
  description         = each.value["description"]
  transport_zone_path = data.nsxt_policy_transport_zone.overlay_tz.path
  connectivity_path   = nsxt_policy_tier1_gateway.tier1[each.value.gateway].path

  subnet {
    cidr    = each.value["gateway_cidr"]
    }

  tag {
    scope = var.nsx_tag_scope
    tag   = var.nsx_tag
  }
}


######################################################################################################################################
#                                                                                                                                    #
# VLAN Segments                                                                                                                           #
#                                                                                                                                    #
######################################################################################################################################

resource "nsxt_policy_vlan_segment" "segment" {
  for_each            = var.nsx_segment_vlan
  display_name        = each.value["display_name"]
  description         = each.value["description"]
  transport_zone_path = data.nsxt_policy_transport_zone.vlan_tz.path
  vlan_ids            = each.value["vlan_ids"]

  tag {
    scope = var.nsx_tag_scope
    tag   = var.nsx_tag
  }
}