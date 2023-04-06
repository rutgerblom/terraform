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
  description = "A mapping of objects for NSX Tier-0 Gateways and associated settings."
}

##################################################################################
# Tier-0 Gateway Interfaces
##################################################################################
variable "tier0_gateway_interface" {
  description = "A mapping of objects for NSX Tier-0 Gateway Interfaces and associated settings."
}

##################################################################################
# Tier-0 Gateway Route Redistribution
##################################################################################
variable "tier0_gateway_redistribution" {
  description = "A mapping of objects for NSX Tier-0 Gateway Route Re-distribution config and associated settings."
}

##################################################################################
# Tier-1 Gateways
##################################################################################
variable "tier1_gateway" {
  description = "A mapping of objects for NSX Tier-1 Gateways and associated settings."
}

##################################################################################
# Overlay segments
##################################################################################
variable "nsx_segment" {
  description = "A mapping of objects for NSX Segments and associated settings."
}

##################################################################################
# VLAN segments
##################################################################################
variable "nsx_segment_vlan" {
  description = "A mapping of objects for NSX Segments and associated settings."
}

##################################################################################
# BGP Neighbors
##################################################################################
variable "bgp_neighbor" {
  description = "A mapping of objects for NSX BGP neighbors and associated settings."
}

##################################################################################
# Groups
##################################################################################
variable "group" {
  description = "A mapping of objects for NSX Group and associated settings."
}