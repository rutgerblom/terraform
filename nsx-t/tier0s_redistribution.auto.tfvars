###################################################################################################################################
#                                                                                                                                 #
# NSX Tier-0 Gateway Route Re-distribution                                                                                        #
# Documentation: https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_gateway_redistribution_config   #
#                https://registry.terraform.io/providers/vmware/nsxt/latest/docs                                                  #
#                                                                                                                                 #
###################################################################################################################################

tier0_gateway_redistribution = {
  redistribution01 = {
    bgp_enabled               = true
    ospf_enabled              = false
    rule_name                 = "Tier-1 Connected"
    rule_types                = ["TIER1_CONNECTED"]
    gateway                   = "gateway01"
  }
}