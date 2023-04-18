###################################################################################################################################
#                                                                                                                                 #
# NSX Segments                                                                                                                    #
# Documentation: https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_segment                         #
#                https://registry.terraform.io/providers/vmware/nsxt/latest/docs                                                  #
#                                                                                                                                 #
###################################################################################################################################

nsx_segment_overlay = {
  segment01 = {
    display_name              = "seg-web"
    description               = "Overlay segment for backend workloads"
    gateway_cidr              = "10.203.20.1/24"
    gateway                   = "gateway01"
  }
  segment02 = {
    display_name              = "seg-db"
    description               = "Overlay segment for backend workloads"
    gateway_cidr              = "10.203.30.1/24"
    gateway                   = "gateway01"
  }
  segment03 = {
    display_name              = "seg-infra"
    description               = "Overlay segment for backend workloads"
    gateway_cidr              = "10.203.10.1/24"
    gateway                   = "gateway01"
  }
}