variable "nsx_manager" {
  description = "NSX Manager FQDN or IP"
}
variable "nsx_username" {
  description = "NSX Manager user"
}
variable "nsx_password" {
  description = "NSX Manager password"
}
variable "nsx_tag_scope" {
  description = "default scope"
}
variable "nsx_tag" {
  description = "default tag"
}
variable "overlay_tz" {
  description = "overlay tansport zone name"
}
variable "edge_cluster" {
  description = "edge cluster name"
}
##################################################################################
# Tier-0 Gateways
##################################################################################
variable "tier0_gateway" {
  type = map(object({
    display_name              = string
    description               = string
    enable_firewall           = bool
    failover_mode             = string
    ha_mode                   = string
    local_as_number           = number
  }))
  description = "A mapping of objects for NSX Tier-0 Gateways and their associated settings."
}

##################################################################################
# Tier-1 Gateways
##################################################################################
variable "tier1_gateway" {
  type = map(object({
    display_name              = string
    description               = string
    enable_standby_relocation = bool
    enable_firewall           = bool
    failover_mode             = string
    tier-0                    = string
  }))
  description = "A mapping of objects for NSX Tier-1 Gateways and their associated settings."
}


##################################################################################
# SEGMENTS
##################################################################################
variable "nsx_segment" {
  type = map(object({
    display_name              = string
    description               = string
    vlan_ids                  = list(string)
    gateway_cidr              = string
    gateway                   = string
  }))
  description = "A mapping of objects for NSX Segments and their associated settings."
}