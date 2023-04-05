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
  display_name  = "T0"
}

#
# The Edge Cluster (for Tier-1 gateways)
#
data "nsxt_policy_edge_cluster" "edge_cluster-01" {
  display_name = "Tier-1 Cluster"
}

#
# The NSX-T Overlay Transport Zone
#
data "nsxt_policy_transport_zone" "overlay_tz" {
  display_name = "TZ-Overlay"
}


#
# Create Tier-1 Gateway
#
resource "nsxt_policy_tier1_gateway" "tier1-01" {
  description     = "Tier-1 gateway created by Terraform"
  display_name    = "tf-tier-1"
  edge_cluster_path = data.nsxt_policy_edge_cluster.edge_cluster-01.path
  tier0_path      = data.nsxt_policy_tier0_gateway.tier0_gateway.path
  enable_standby_relocation = "false"
  enable_firewall = false
  failover_mode   = "NON_PREEMPTIVE"
  route_advertisement_types = [
    "TIER1_LB_VIP",
    "TIER1_NAT",
    "TIER1_CONNECTED",
    "TIER1_STATIC_ROUTES"]
}

#
# Create segment web
#
resource "nsxt_policy_segment" "segment1" {
  description       = "Web segment"
  display_name      = "tf-web"
  transport_zone_path = data.nsxt_policy_transport_zone.overlay_tz.path
  connectivity_path = nsxt_policy_tier1_gateway.tier1-01.path
  subnet {
    cidr    = "172.16.1.1/24"
    }

  tag {
    scope = var.nsx_tag_scope
    tag   = var.nsx_tag
  }

  tag {
    scope = "tier"
    tag   = "web"
  }
}

#
# Create segment app
#
resource "nsxt_policy_segment" "segment2" {
  description       = "App segment"
  display_name      = "tf-app"
  transport_zone_path = data.nsxt_policy_transport_zone.overlay_tz.path
  connectivity_path = nsxt_policy_tier1_gateway.tier1-01.path
  subnet {
    cidr    = "172.16.2.1/24"
    }

  tag {
    scope = var.nsx_tag_scope
    tag   = var.nsx_tag
  }

  tag {
    scope = "tier"
    tag   = "app"
  }
}

#
# Create segment db
#
resource "nsxt_policy_segment" "segment3" {
  description       = "DB segment"
  display_name      = "tf-db"
  transport_zone_path = data.nsxt_policy_transport_zone.overlay_tz.path
  connectivity_path = nsxt_policy_tier1_gateway.tier1-01.path
  subnet {
    cidr    = "172.16.3.1/24"
    }

  tag {
    scope = var.nsx_tag_scope
    tag   = var.nsx_tag
  }

  tag {
    scope = "tier"
    tag   = "db"
  }
}
