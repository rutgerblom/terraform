###################################################################################################################################
#                                                                                                                                 #
# NSX Segments                                                                                                                    #
# Documentation: https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_segment                         #
#                https://registry.terraform.io/providers/vmware/nsxt/latest/docs                                                  #
#                                                                                                                                 #
###################################################################################################################################

nsx_segment = {
  segment01 = {
    display_name              = "sg-backend"
    description               = "Overlay segment for backend worloads"
    vlan_ids                  = []
    gateway_cidr              = "10.203.60.1/24"
    gateway                   = "Tier-1-03"
  }
}