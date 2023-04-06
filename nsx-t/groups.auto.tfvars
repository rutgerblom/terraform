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
    ipaddress_expression      = null
  }
  group02 = {
    display_name              = "SG-DNS"
    description               = "Group contains DNS Servers"
    key                       = "Tag"
    member_type               = "VirtualMachine"
    operator                  = "EQUALS"
    value                     = "Application|DNS"
    ipaddress_expression      = null
  }
  group03 = {
    display_name              = "SG-NTP"
    description               = "Group contains NTP Servers"
    key                       = "Tag"
    member_type               = "VirtualMachine"
    operator                  = "EQUALS"
    value                     = "Application|NTP"
    ipaddress_expression      = null
  }
  group04 = {
    display_name              = "SG-Syslog"
    description               = "Group contains Syslog Servers"
    key                       = "Tag"
    member_type               = "VirtualMachine"
    operator                  = "EQUALS"
    value                     = "Application|Syslog"
    ipaddress_expression      = null
  }
  group05 = {
    display_name              = "SG-Backup"
    description               = "Group contains Backup Targets"
    key                       = "Tag"
    member_type               = "VirtualMachine"
    operator                  = "EQUALS"
    value                     = "Application|Backup"
    ipaddress_expression      = null
  }
  group06 = {
    display_name              = "SG-RFC1918"
    description               = "Group contains RFC 1918 IP subnets"
    key                       = null
    member_type               = null
    operator                  = null
    value                     = null
    ipaddress_expression      = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
  }
}