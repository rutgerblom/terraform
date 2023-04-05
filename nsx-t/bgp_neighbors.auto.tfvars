###################################################################################################################################
#                                                                                                                                 #
# NSX BGP Neighbors                                                                                                               #
# Documentation: https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_bgp_neighbor                    #
#                https://registry.terraform.io/providers/vmware/nsxt/latest/docs                                                  #
#                                                                                                                                 #
###################################################################################################################################

bgp_neighbor = {
  neighbor01 = {
    display_name              = "bgp_neighbor_1"
    description               = "BGP Neighbor #1"
    allow_as_in               = true
    graceful_restart_mode     = "HELPER_ONLY"
    hold_down_time            = "300"
    keep_alive_time           = "100"
    neighbor_address          = "192.168.15.1"
    remote_as_num             = "65100"
    source_interface          = "interface01"
  }
}