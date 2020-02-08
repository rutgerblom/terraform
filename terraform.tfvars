# Provider
provider_vsphere_host = "vcenter.demo.local"
provider_vsphere_user = "administrator@vsphere.local"
provider_vsphere_password = "VMware1!"

# Infrastructure
deploy_vsphere_datacenter = "Datacenter"
deploy_vsphere_cluster = "Cluster"
deploy_vsphere_datastore = "demo_nfs01"
deploy_vsphere_folder = "/Dummies"
deploy_vsphere_network = "vlan-301"

# Guest
guest_template = "ubuntu_18.04"
guest_vcpu = "2"
guest_memory = "2048"
guest_ipv4_netmask = "24"
guest_ipv4_gateway = "10.2.129.1"
guest_dns_servers = "10.2.129.10"
guest_dns_suffix = "demo.local"
guest_domain = "demo.local"