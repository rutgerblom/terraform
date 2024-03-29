###################################################################################################################################
#                                                                                                                                 #
# NSX Tier-0 Gateways                                                                                                             #
# Documentation: https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_tier0_gateway                   #
#                https://registry.terraform.io/providers/vmware/nsxt/latest/docs                                                  #
#                                                                                                                                 #
###################################################################################################################################

tier0_gateway = {
  gateway01 = {
    display_name              = "Tier-0"
    description               = "Tier-0 Gateway"
    enable_firewall           = false
    failover_mode             = "NON_PREEMPTIVE"
    ha_mode                   = "ACTIVE_ACTIVE"
    local_as_number           = 65101
    inter_sr_ibgp             = true
    multipath_relax           = true
  }
}