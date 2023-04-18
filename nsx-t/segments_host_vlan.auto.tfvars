###################################################################################################################################
#                                                                                                                                 #
# NSX VLAN Segments                                                                                                               #
# Documentation: https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_vlan_segment                    #
#                https://registry.terraform.io/providers/vmware/nsxt/latest/docs                                                  #
#                                                                                                                                 #
###################################################################################################################################

nsx_segment_host_vlan = {
  segment01 = {
    display_name              = "sg-vlan-1611"
    description               = "VLAN segment"
    vlan_ids                  = [1611]
  }
  segment02 = {
    display_name              = "sg-vlan-1612"
    description               = "VLAN segment"
    vlan_ids                  = [1612]
  }
}