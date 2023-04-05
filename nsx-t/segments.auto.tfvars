###################################################################################################################################
#                                                                                                                                 #
# NSX Segments                                                                                                                    #
# Documentation: https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_segment                         #
#                https://registry.terraform.io/providers/vmware/nsxt/latest/docs                                                  #
#                                                                                                                                 #
###################################################################################################################################

nsx_segment = {
  segment01 = {
    display_name              = "sg-backend"
    description               = "Overlay segment for backend worloads"
    transport_zone_path       = "dvSwitch01"
    vlan_ids                  = []
    active_uplinks            = [ "uplink1", "uplink2" ]
    standby_uplinks           = []
    auto_expand               = true
    oneview_network_type      = "Tagged"                   # Must be "Tagged"
    oneview_type              = "ethernet-networkV4"       # Must be "ethernet-networkV4" 
    oneview_purpose           = "Management"               # Choose between "Management", "VMMigration", "ISCSI", and "General"
    oneview_smartlink         = true                       # Must be "true"
    oneview_network_set       = "vSphere System Traffic"   # Choose between "vSphere System Traffic", "NFS", "iSCSI-A", "iSCSI-B", and "Production"                 
    oneview_publish           = true                       # Set to "true" if the vSphere port group should have an equivalent network object in OneView (Synergy)
  }
}