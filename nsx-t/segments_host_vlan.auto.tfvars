###################################################################################################################################
#                                                                                                                                 #
# NSX VLAN Segments                                                                                                               #
# Documentation: https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_vlan_segment                    #
#                https://registry.terraform.io/providers/vmware/nsxt/latest/docs                                                  #
#                                                                                                                                 #
###################################################################################################################################

nsx_segment_host_vlan = {
  segment01 = {
    display_name              = "sg-vlan-1623"
    description               = "VLAN segment"
    vlan_ids                  = [1623]
  }
}