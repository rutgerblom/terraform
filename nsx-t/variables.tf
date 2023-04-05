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
variable "vlan_tz" {
  description = "vlan tansport zone name"
}
variable "edge_cluster" {
  description = "edge cluster name"
}
variable "edge_node" {
  description = "edge node name"
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
# Tier-0 Gateway Interfaces
##################################################################################
variable "tier0_gateway_interface" {
  type = map(object({
    display_name              = string
    description               = string
    type                      = string
    gateway                   = string
    segment                   = string
    subnets                   = list(string)
  }))
  description = "A mapping of objects for NSX Tier-0 Gateway Interfaces and their associated settings."
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
# SEGMENTS Overlay
##################################################################################
variable "nsx_segment" {
  type = map(object({
    display_name              = string
    description               = string
    gateway_cidr              = string
    gateway                   = string
  }))
  description = "A mapping of objects for NSX Segments and their associated settings."
}

##################################################################################
# SEGMENTS VLAN
##################################################################################
variable "nsx_segment_vlan" {
  type = map(object({
    display_name              = string
    description               = string
    vlan_ids                  = list(number)
  }))
  description = "A mapping of objects for NSX Segments and their associated settings."
}

##################################################################################
# BGP Neighbors
##################################################################################
variable "bgp_neighbor" {
  type = map(object({
    display_name              = string
    description               = string
    bgp_path                  = string
    allow_as_in               = bool
    graceful_restart_mode     = string
    hold_down_time            = number
    keep_alive_time           = number
    neighbor_address          = string
    remote_as_num             = number
    source_interface          = string
  }))
  description = "A mapping of objects for NSX BGP neighbors and their associated settings."
}