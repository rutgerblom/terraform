###################################################################################################################################
#                                                                                                                                 #
# NSX Tier-1 Gateways                                                                                                             #
# Documentation: https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_tier1_gateway                   #
#                https://registry.terraform.io/providers/vmware/nsxt/latest/docs                                                  #
#                                                                                                                                 #
###################################################################################################################################

tier1_gateway = {
  gateway01 = {
    display_name              = "Tier-1-03"
    description               = "Tier-1 Gateway #3"
    enable_standby_relocation = false
    enable_firewall           = false
    failover_mode             = "NON_PREEMPTIVE"
  }
}