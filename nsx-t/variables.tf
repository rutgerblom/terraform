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
variable "edge_tz" {
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
    inter_sr_ibgp             = bool
    multipath_relax           = bool
  }))
  description = "A mapping of objects for NSX Tier-0 Gateways and associated settings."
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
  description = "A mapping of objects for NSX Tier-0 Gateway Interfaces and associated settings."
}

##################################################################################
# Tier-0 Gateway Route Redistribution
##################################################################################
variable "tier0_gateway_redistribution" {
  type = map(object({
    bgp_enabled               = bool
    ospf_enabled              = bool
    rule_name                 = string
    rule_types                = list(string)
    tier-0                    = string
  }))
  description = "A mapping of objects for NSX Tier-0 Gateway Route Re-distribution config and associated settings."
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
    route_advertisement_types = list(string)
    tier-0                    = string
  }))
  description = "A mapping of objects for NSX Tier-1 Gateways and associated settings."
}

##################################################################################
# Overlay segments
##################################################################################
variable "nsx_segment" {
  type = map(object({
    display_name              = string
    description               = string
    gateway_cidr              = string
    gateway                   = string
  }))
  description = "A mapping of objects for NSX Segments and associated settings."
}

##################################################################################
# VLAN segments
##################################################################################
variable "nsx_segment_vlan" {
  type = map(object({
    display_name              = string
    description               = string
    vlan_ids                  = list(number)
  }))
  description = "A mapping of objects for NSX Segments and associated settings."
}

##################################################################################
# BGP Neighbors
##################################################################################
variable "bgp_neighbor" {
  type = map(object({
    display_name              = string
    description               = string
    allow_as_in               = bool
    graceful_restart_mode     = string
    hold_down_time            = number
    keep_alive_time           = number
    neighbor_address          = string
    remote_as_num             = number
    source_interface          = string
    tier-0                    = string
  }))
  description = "A mapping of objects for NSX BGP neighbors and associated settings."
}

##################################################################################
# Groups
##################################################################################
variable "group" {
  type = map(object({
    vm_group                    = optional(object({
      display_name              = string
      description               = string
      key                       = string
      member_type               = string
      operator                  = string
      value                     = string
    ipaddress_expression        = list(string)
    }))
    ip_group                    = optional(object({
      display_name              = string
      description               = string
      ipaddress_expression      = list(string)
    }))
  }))
  description = "A mapping of objects for NSX Group and associated settings."
}