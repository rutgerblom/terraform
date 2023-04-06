###################################################################################################################################
#                                                                                                                                 #
# NSX Groups                                                                                                                      #
# Documentation: https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_group                           #
#                https://registry.terraform.io/providers/vmware/nsxt/latest/docs                                                  #
#                                                                                                                                 #
###################################################################################################################################

group = {
  vm_group = {
    group001 = {
      display_name              = "SG-AD"
      description               = "Group contains AD Domain Controllers"
      key                       = "Tag"
      member_type               = "VirtualMachine"
      operator                  = "EQUALS"
      value                     = "Application|AD"
    }
    group002 = {
      display_name              = "SG-DNS"
      description               = "Group contains DNS Servers"
      key                       = "Tag"
      member_type               = "VirtualMachine"
      operator                  = "EQUALS"
      value                     = "Application|DNS"
      ipaddress_expression      = []
    }
    group003 = {
      display_name              = "SG-NTP"
      description               = "Group contains NTP Servers"
      key                       = "Tag"
      member_type               = "VirtualMachine"
      operator                  = "EQUALS"
      value                     = "Application|NTP"
      ipaddress_expression      = []
    }
    group004 = {
      display_name              = "SG-Syslog"
      description               = "Group contains Syslog Servers"
      key                       = "Tag"
      member_type               = "VirtualMachine"
      operator                  = "EQUALS"
      value                     = "Application|Syslog"
      ipaddress_expression      = []
    }
    group005 = {
      display_name              = "SG-Backup"
      description               = "Group contains Backup Targets"
      key                       = "Tag"
      member_type               = "VirtualMachine"
      operator                  = "EQUALS"
      value                     = "Application|Backup"
      ipaddress_expression      = []
    }
  }
  ip_group006 = {
    group = {
      display_name              = "SG-RFC1918"
      description               = "Group contains RFC 1918 IP subnets"
      ipaddress_expression      = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
    }
  }
}