###################################################################################################################################
#                                                                                                                                 #
# NSX VLAN Segments                                                                                                               #
# Documentation: https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_vlan_segment                    #
#                https://registry.terraform.io/providers/vmware/nsxt/latest/docs                                                  #
#                                                                                                                                 #
###################################################################################################################################

nsx_segment_vlan = {
  segment01 = {
    display_name              = "sg-vlan-2711"
    description               = "VLAN segment for BGP uplink1"
    vlan_ids                  = [2711]
    transport_zone            = "edge_tz"
  }
  segment02 = {
    display_name              = "sg-vlan-2712"
    description               = "VLAN segment for BGP uplink2"
    vlan_ids                  = [2712]
    transport_zone            = "edge_tz"
  }
  segment03 = {
    display_name              = "sg-vlan-1611"
    description               = "VLAN segment"
    vlan_ids                  = [1611]
    transport_zone            = "vlan_tz"
  }
  segment04 = {
    display_name              = "sg-vlan-1612"
    description               = "VLAN segment"
    vlan_ids                  = [1612]
    transport_zone            = "vlan_tz"
  }
}