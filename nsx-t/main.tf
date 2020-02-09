#
# The VMware NSX-T provider to connect to the NSX
# REST API running on the NSX-T Manager cluster.
#
provider "nsxt" {
  host                  = var.nsx_manager
  username              = var.nsx_username
  password              = var.nsx_password
  allow_unverified_ssl  = true
  max_retries           = 10
  retry_min_delay       = 500
  retry_max_delay       = 5000
  retry_on_status_codes = [429]
}

#
# The NSX-T Overlay Transport Zone
#
data "nsxt_transport_zone" "overlay_tz" {
  display_name = "TZ-Overlay"
}

#
# The Edge Cluster for Tier-1 Gateways
#
data "nsxt_edge_cluster" "edge_cluster_tier1" {
  display_name = "Tier-1 Cluster"
}

#
# The Tier-0 Gateway
#
data "nsxt_policy_tier0_gateway" "tier0_gateway" {
  display_name = "T0"
}

#
# Create the Tier-1 Gateway
#
resource "nsxt_policy_tier1_gateway" "tier1-01" {
  description     = "Created by Terraform"
  display_name    = "T1-CustomerX"
}

#
# Creating the NSX-T Segments
#
resource "nsxt_policy_segment" "segment1" {
  description       = "Created by Terraform"
  display_name      = "web"
  transport_zone_path = var.transport_zone_path

  tag {
    scope = var.nsx_tag_scope
    tag   = var.nsx_tag
  }

  tag {
    scope = "tier"
    tag   = "web"
  }
}
resource "nsxt_policy_segment" "segment2" {
  description       = "Created by Terraform"
  display_name      = "app"
  transport_zone_path = var.transport_zone_path

  tag {
    scope = var.nsx_tag_scope
    tag   = var.nsx_tag
  }

  tag {
    scope = "tier"
    tag   = "app"
  }
}
  resource "nsxt_policy_segment" "segment3" {
  description       = "Created by Terraform"
  display_name      = "db"
  transport_zone_path = var.transport_zone_path

  tag {
    scope = var.nsx_tag_scope
    tag   = var.nsx_tag
  }

  tag {
    scope = "tier"
    tag   = "db"
  }
}