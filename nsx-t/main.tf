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
# The existing NSX-T Overlay Transport Zone
#
data "nsxt_policy_transport_zone" "overlay_tz" {
  display_name = "TZ-Overlay"
}

#
# The existing Tier-0 Gateway
#
data "nsxt_policy_tier0_gateway" "tier0_gateway" {
  display_name  = "T0"
}

#
# Create new Tier-1 Gateway
#
resource "nsxt_policy_tier1_gateway" "tier1-01" {
  description     = "Managed by Terraform"
  display_name    = "T1-CustomerX"
  tier0_path      = "/infra/tier-0s/T0"
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
# New Tier-1 Gateway as data resource
#
data "nsxt_policy_tier1_gateway" "tier1-01" {
  display_name    = "T1-CustomerX"
}

#
# Creating the NSX-T Segments
#
resource "nsxt_policy_segment" "segment1" {
  description       = "Managed by Terraform"
  display_name      = "web"
  transport_zone_path = data.nsxt_policy_transport_zone.overlay_tz.path
  connectivity_path = data.nsxt_policy_tier1_gateway.tier1-01.path
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