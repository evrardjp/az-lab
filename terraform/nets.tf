### Networks
# azlabNet-jumphost is a firewalled network that allow the entrance to this lab
# The rest are L2 networks like in traditional deploys. 

# Basic router with interface in all networks
resource "openstack_networking_router_v2" "azlabRouter" {
  name                = "azlab-router"
  admin_state_up      = true
  external_network_id = var.external_gateway_networkid
}


resource "openstack_networking_network_v2" "azlabNet-jumphost" {
  name = "azlab-net-jumphost"
  admin_state_up = "true"
  port_security_enabled = "true"
}
resource "openstack_networking_subnet_v2" "azlabSubnet-jumphost" {
  network_id      = openstack_networking_network_v2.azlabNet-jumphost.id
  name            = var.azlab_segment_jumphost["subnet_name"]
  cidr            = var.azlab_segment_jumphost["cidr"]
  ip_version      = var.azlab_segment_jumphost["ip_version"]
  dns_nameservers = split(",", var.azlab_segment_jumphost["dns_ip"])
}
resource "openstack_networking_router_interface_v2" "azlabRouterInt-jumphost" {
  router_id = openstack_networking_router_v2.azlabRouter.id
  subnet_id = openstack_networking_subnet_v2.azlabSubnet-jumphost.id
}


resource "openstack_networking_network_v2" "azlabNet-mgmt" {
  name = "azlab-net-mgmt"
  admin_state_up = "true"
  port_security_enabled = "true"
}
resource "openstack_networking_subnet_v2" "azlabSubnet-mgmt" {
  network_id      = openstack_networking_network_v2.azlabNet-mgmt.id
  name            = var.azlab_segment_mgmt["subnet_name"]
  cidr            = var.azlab_segment_mgmt["cidr"]
  ip_version      = var.azlab_segment_mgmt["ip_version"]
  dns_nameservers = split(",", var.azlab_segment_mgmt["dns_ip"])
}
resource "openstack_networking_router_interface_v2" "azlabRouterInt-mgmt" {
  router_id = openstack_networking_router_v2.azlabRouter.id
  subnet_id = openstack_networking_subnet_v2.azlabSubnet-mgmt.id
}


resource "openstack_networking_network_v2" "azlabNet-storage" {
  name = "azlab-net-storage"
  admin_state_up = "true"
  port_security_enabled = "true"
}
resource "openstack_networking_subnet_v2" "azlabSubnet-storage" {
  network_id      = openstack_networking_network_v2.azlabNet-storage.id
  name            = var.azlab_segment_storage["subnet_name"]
  cidr            = var.azlab_segment_storage["cidr"]
  ip_version      = var.azlab_segment_storage["ip_version"]
  dns_nameservers = split(",", var.azlab_segment_storage["dns_ip"])
}
resource "openstack_networking_router_interface_v2" "azlabRouterInt-storage" {
  router_id = openstack_networking_router_v2.azlabRouter.id
  subnet_id = openstack_networking_subnet_v2.azlabSubnet-storage.id
}


resource "openstack_networking_network_v2" "azlabNet-vxlan" {
  name = "azlab-net-vxlan"
  admin_state_up = "true"
  port_security_enabled = "true"
}
resource "openstack_networking_subnet_v2" "azlabSubnet-vxlan" {
  network_id      = openstack_networking_network_v2.azlabNet-vxlan.id
  name            = var.azlab_segment_vxlan["subnet_name"]
  cidr            = var.azlab_segment_vxlan["cidr"]
  ip_version      = var.azlab_segment_vxlan["ip_version"]
  dns_nameservers = split(",", var.azlab_segment_vxlan["dns_ip"])
}
resource "openstack_networking_router_interface_v2" "azlabRouterInt-vxlan" {
  router_id = openstack_networking_router_v2.azlabRouter.id
  subnet_id = openstack_networking_subnet_v2.azlabSubnet-vxlan.id
}


resource "openstack_networking_network_v2" "azlabNet-octavia" {
  name = "azlab-net-octavia"
  admin_state_up = "true"
  port_security_enabled = "true"
}
resource "openstack_networking_subnet_v2" "azlabSubnet-octavia" {
  network_id      = openstack_networking_network_v2.azlabNet-octavia.id
  name            = var.azlab_segment_octavia["subnet_name"]
  cidr            = var.azlab_segment_octavia["cidr"]
  ip_version      = var.azlab_segment_octavia["ip_version"]
  dns_nameservers = split(",", var.azlab_segment_octavia["dns_ip"])
}
resource "openstack_networking_router_interface_v2" "azlabRouterInt-octavia" {
  router_id = openstack_networking_router_v2.azlabRouter.id
  subnet_id = openstack_networking_subnet_v2.azlabSubnet-octavia.id
}