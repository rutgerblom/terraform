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

#
# The Tier-0 Gateway
#
data "nsxt_policy_tier0_gateway" "tier0_gateway" {
  display_name  = var.tier0_gateway
}

#
# The Edge Cluster (for Tier-1 gateways)
#
data "nsxt_policy_edge_cluster" "edge_cluster-01" {
  display_name = var.edge_cluster
}

#
# The NSX-T Overlay Transport Zone
#
data "nsxt_policy_transport_zone" "overlay_tz" {
  display_name = var.overlay_tz
}

#
# Create Tier-1 Gateway
#
resource "nsxt_policy_tier1_gateway" "tier-1-03" {
  description     = "Tier-1 gateway created by Terraform"
  display_name    = var.tier1_gateway
  edge_cluster_path = data.nsxt_policy_edge_cluster.edge_cluster-01.path
  tier0_path      = data.nsxt_policy_tier0_gateway.tier0_gateway.path
  enable_standby_relocation = "false"
  enable_firewall = false
  failover_mode   = "NON_PREEMPTIVE"
  route_advertisement_types = [
    "TIER1_CONNECTED"]
}


######################################################################################################################################
#                                                                                                                                    #
# Segments                                                                                                                           #
#                                                                                                                                    #
######################################################################################################################################

resource "nsxt_policy_segment" "segment" {
  for_each            = var.nsx_segment
  display_name        = each.value["display_name"]
  description         = each.value["description"]
  transport_zone_path = data.nsxt_policy_transport_zone.overlay_tz.path
  connectivity_path   = nsxt_policy_tier1_gateway.tier-1-03.path
  vlan_ids            = each.value["vlan_ids"]

  subnet {
    cidr    = each.value["gateway_cidr"]
    }

  tag {
    scope = var.nsx_tag_scope
    tag   = var.nsx_tag
  }
}
