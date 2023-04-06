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
  group02 = {
    display_name              = "SG-DNS"
    description               = "Group contains DNS Servers"
    key                       = "Tag"
    member_type               = "VirtualMachine"
    operator                  = "EQUALS"
    value                     = "Application|DNS"
  }
  group03 = {
    display_name              = "SG-NTP"
    description               = "Group contains NTP Servers"
    key                       = "Tag"
    member_type               = "VirtualMachine"
    operator                  = "EQUALS"
    value                     = "Application|NTP"
  }
  group04 = {
    display_name              = "SG-Syslog"
    description               = "Group contains Syslog Servers"
    key                       = "Tag"
    member_type               = "VirtualMachine"
    operator                  = "EQUALS"
    value                     = "Application|Syslog"
  }
  group05 = {
    display_name              = "SG-Backup"
    description               = "Group contains Backup Targets"
    key                       = "Tag"
    member_type               = "VirtualMachine"
    operator                  = "EQUALS"
    value                     = "Application|Backup"
  }
}