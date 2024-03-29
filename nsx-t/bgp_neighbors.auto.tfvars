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
    hold_down_time            = 3
    keep_alive_time           = 1
    neighbor_address          = "192.168.15.1"
    remote_as_num             = 65100
    source_interface          = "interface01"
    tier-0                    = "gateway01"
  }
  neighbor02 = {
    display_name              = "bgp_neighbor_2"
    description               = "BGP Neighbor #2"
    allow_as_in               = true
    graceful_restart_mode     = "HELPER_ONLY"
    hold_down_time            = 3
    keep_alive_time           = 1
    neighbor_address          = "192.168.16.1"
    remote_as_num             = 65100
    source_interface          = "interface02"
    tier-0                    = "gateway01"
  }
}