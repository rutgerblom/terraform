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
variable "tier0_gateway" {
  description = "tier 0 gateway name"
}
variable "tier1_gateway" {
  description = "tier 1 gateway name"
}
variable "nsx_segment" {
  description = "segment"
}