###################################################################################################################################
#                                                                                                                                 #
# NSX Tier-0 Gateway Interfaces                                                                                                   #
# Documentation: hhttps://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_tier0_gateway_interface        #
#                https://registry.terraform.io/providers/vmware/nsxt/latest/docs                                                  #
#                                                                                                                                 #
###################################################################################################################################

tier0_gateway_interface = {
  interface01 = {
    display_name              = "en01_uplink-01"
    description               = "BGP Uplink 01"
    type                      = "EXTERNAL"
    gateway                   = "gateway01"
    segment                   = "segment01"
    subnets                   = ["192.168.15.1/24"]
  }
  interface02 = {
    display_name              = "en01_uplink-02"
    description               = "BGP Uplink 02"
    type                      = "EXTERNAL"
    gateway                   = "gateway01"
    segment                   = "segment02"
    subnets                   = ["192.168.16.1/24"]
  }
}