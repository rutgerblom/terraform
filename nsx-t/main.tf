#
# The first step is to configure the VMware NSX provider to connect to the NSX
# REST API running on the NSX manager.
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
# This part of the example shows some data sources we will need to refer to
# later in the .tf file. They include the transport zone, tier 0 router and
# edge cluster.
#
data "nsxt_transport_zone" "overlay_tz" {
  display_name = "TZ-Overlay"
}

#
# The tier 0 router (T0) is considered a "provider" router that is pre-created
# by the NSX admin. A T0 router is used for north/south connectivity between
# the logical networking space and the physical networking space. Many tier 1
# routers will be connected to a tier 0 router.
#
data "nsxt_policy_tier0_gateway" "tier0_gateway" {
  display_name = "T0"
}

data "nsxt_edge_cluster" "edge_cluster_tier1" {
  display_name = "Tier-1 Cluster"
}

#
# This shows the settings required to create a NSX logical switch to which you
# can attach virtual machines.
#
resource "nsxt_policy_segment" "segment1" {
  description       = "Segment created by Terraform"
  display_name      = "segment1"
  transport_zone_path = "/infra/sites/default/enforcement-points/default/transport-zones/12d25875-7960-4ceb-91f1-f39a24a57014"

  tag {
    scope = var.nsx_tag_scope
    tag   = var.nsx_tag
  }

  tag {
    scope = "tenant"
    tag   = "second_example_tag"
  }
}
