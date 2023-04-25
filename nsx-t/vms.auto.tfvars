###################################################################################################################################
#                                                                                                                                 #
# Virtual Machines in the NSX inventory                                                                                                           #
# Documentation: https://registry.terraform.io/providers/vmware/nsxt/latest/docs/data-sources/policy_vm                           #
#                https://registry.terraform.io/providers/vmware/nsxt/latest/docs                                                  #
#                                                                                                                                 #
###################################################################################################################################

nsx_vm = {
  nsx_vm0001 = {
    display_name = "AD"
  }
  nsx_vm0002 = {
    display_name = "Dev-App01-Db"
  }
  nsx_vm0003 = {
    display_name = "Dev-App01-Db"
  }
  nsx_vm0004 = {
    display_name = "DNS"
  }
  nsx_vm0005 = {
    display_name = "Jumphost"
  }
  nsx_vm0006 = {
    display_name = "NTP"
  }
  nsx_vm0007 = {
    display_name = "Prod-App01-Db"
  }
  nsx_vm0008 = {
    display_name = "Prod-App01-Web"
  }
  nsx_vm0009 = {
    display_name = "Prod-App02-Db"
  }
  nsx_vm0010 = {
    display_name = "Prod-App02-Web"
  }
    nsx_vm0011 = {
    display_name = "Syslog"
  }
}