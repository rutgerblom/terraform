###################################################################################################################################
#                                                                                                                                 #
# NSX VLAN Segments                                                                                                               #
# Documentation: https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_vlan_segment                    #
#                https://registry.terraform.io/providers/vmware/nsxt/latest/docs                                                  #
#                                                                                                                                 #
###################################################################################################################################

nsx_segment_edge_vlan = {
  segment01 = {
    display_name              = "sg-transit-red"
    description               = "VLAN segment for BGP uplink1"
    vlan_ids                  = [2711]
  }
  segment02 = {
    display_name              = "sg-transit-blue"
    description               = "VLAN segment for BGP uplink2"
    vlan_ids                  = [2712]
  }
}