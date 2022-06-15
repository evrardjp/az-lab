resource "openstack_networking_floatingip_v2" "labFloatingIP" {
  pool = var.external_network
}

resource "openstack_compute_instance_v2" "deployer" {
  name        = var.deployer["name"]
  image_name  = var.deployer["image"]
  flavor_name = var.deployer["flavor"]
  key_pair    = openstack_compute_keypair_v2.user_key.name
  security_groups = [
    openstack_compute_secgroup_v2.ssh.id,
    openstack_compute_secgroup_v2.icmp.id,    
  ]
  network {
    uuid = openstack_networking_network_v2.azlabNet-jumphost.id
  }
  network {
    uuid = openstack_networking_network_v2.azlabNet-mgmt.id
  }
  network {
    uuid = openstack_networking_network_v2.azlabNet-storage.id
  }
  network {
    uuid = openstack_networking_network_v2.azlabNet-vxlan.id
  }
  network {
    uuid = openstack_networking_network_v2.azlabNet-octavia.id
  }
}

resource "openstack_compute_floatingip_associate_v2" "deployerFloatingIPAttach" {
  floating_ip = "${openstack_networking_floatingip_v2.labFloatingIP.address}"
  instance_id = "${openstack_compute_instance_v2.deployer.id}"
}

#### LBs (2)
resource "openstack_compute_instance_v2" "loadbalancer" {
  for_each = var.loadbalancers

  name        = each.key
  image_name  = var.loadbalancers_image
  flavor_name = var.loadbalancers_flavor
  key_pair    = openstack_compute_keypair_v2.user_key.name

  network {
    uuid = openstack_networking_network_v2.azlabNet-mgmt.id
    fixed_ip_v4 = each.value["mgmtIP"]
  }
  network {
    uuid = openstack_networking_network_v2.azlabNet-storage.id
    fixed_ip_v4 = each.value["storageIP"]
  }
  network {
    uuid = openstack_networking_network_v2.azlabNet-vxlan.id
    fixed_ip_v4 = each.value["vxlanIP"]
  }
  network {
    uuid = openstack_networking_network_v2.azlabNet-octavia.id
    fixed_ip_v4 = each.value["octaviaIP"]
  }
}

#### Controllers (3)
resource "openstack_compute_instance_v2" "controller" {
  for_each = var.controllers

  name        = each.key
  image_name  = var.controllers_image
  flavor_name = var.controllers_flavor
  key_pair    = openstack_compute_keypair_v2.user_key.name

  network {
    uuid = openstack_networking_network_v2.azlabNet-mgmt.id
    fixed_ip_v4 = each.value["mgmtIP"]
  }
  network {
    uuid = openstack_networking_network_v2.azlabNet-storage.id
    fixed_ip_v4 = each.value["storageIP"]
  }
  network {
    uuid = openstack_networking_network_v2.azlabNet-vxlan.id
    fixed_ip_v4 = each.value["vxlanIP"]
  }
  network {
    uuid = openstack_networking_network_v2.azlabNet-octavia.id
    fixed_ip_v4 = each.value["octaviaIP"]
  }
}


#### Computes (3)
resource "openstack_compute_instance_v2" "compute" {
  for_each = var.computes

  name        = each.key
  image_name  = var.computes_image
  flavor_name = var.computes_flavor
  key_pair    = openstack_compute_keypair_v2.user_key.name

  network {
    uuid = openstack_networking_network_v2.azlabNet-mgmt.id
    fixed_ip_v4 = each.value["mgmtIP"]
  }
  network {
    uuid = openstack_networking_network_v2.azlabNet-storage.id
    fixed_ip_v4 = each.value["storageIP"]
  }
  network {
    uuid = openstack_networking_network_v2.azlabNet-vxlan.id
    fixed_ip_v4 = each.value["vxlanIP"]
  }
  network {
    uuid = openstack_networking_network_v2.azlabNet-octavia.id
    fixed_ip_v4 = each.value["octaviaIP"]
  }
}

#### Storages (3)
resource "openstack_compute_instance_v2" "storage" {
  for_each = var.storages

  name        = each.key
  image_name  = var.storages_image
  flavor_name = var.storages_flavor
  key_pair    = openstack_compute_keypair_v2.user_key.name

  network {
    uuid = openstack_networking_network_v2.azlabNet-mgmt.id
    fixed_ip_v4 = each.value["mgmtIP"]
  }
  network {
    uuid = openstack_networking_network_v2.azlabNet-storage.id
    fixed_ip_v4 = each.value["storageIP"]
  }
  network {
    uuid = openstack_networking_network_v2.azlabNet-vxlan.id
    fixed_ip_v4 = each.value["vxlanIP"]
  }
  network {
    uuid = openstack_networking_network_v2.azlabNet-octavia.id
    fixed_ip_v4 = each.value["octaviaIP"]
  }
}