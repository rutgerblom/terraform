###################################################################################################################################
#                                                                                                                                 #
# NSX Groups                                                                                                                      #
# Documentation: https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_group                           #
#                https://registry.terraform.io/providers/vmware/nsxt/latest/docs                                                  #
#                                                                                                                                 #
###################################################################################################################################

group = {
  group01 = {
    display_name              = "SG-AD"
    description               = "Group contains AD Domain Controllers"
    key                       = "Tag"
    member_type               = "VirtualMachine"
    operator                  = "EQUALS"
    value                     = "Application|AD"
  }
}