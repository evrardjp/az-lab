output deployer_ip {
    value = openstack_networking_floatingip_v2.labFloatingIP.address
}