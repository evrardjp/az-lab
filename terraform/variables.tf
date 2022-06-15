# Params file for variables

variable "sshkey" {
  type		= string
}

################
#### GLANCE ####
################

variable "image" {
  type    = string
  default = "Ubuntu 20.04 Focal Fossa 20200423"
}

#################
#### NEUTRON ####
#################

variable "external_network" {
  type    = string
  default = "ext-net"
}

variable "external_gateway_networkid" {
  type    = string
  default = "fba95253-5543-4078-b793-e2de58c31378"
}

variable "azlab_segment_jumphost" {
  type = map(string)
  default = {
    subnet_name = "azlab_segment_jumphost"
    cidr        = "192.168.42.0/24"
    ip_version  = 4
    dns_ip      = "8.8.8.8,8.8.4.4"
  }
}
variable "azlab_segment_mgmt" {
  type = map(string)
  default = {
    subnet_name = "azlab_segment_mgmt"
    cidr        = "192.168.1.0/24"
    ip_version  = 4
    dns_ip      = "8.8.8.8,8.8.4.4"
  }
}
variable "azlab_segment_storage" {
  type = map(string)
  default = {
    subnet_name = "azlab_segment_storage"
    cidr        = "192.168.2.0/24"
    ip_version  = 4
    dns_ip      = "8.8.8.8,8.8.4.4"
  }
}
variable "azlab_segment_vxlan" {
  type = map(string)
  default = {
    subnet_name = "azlab_segment_vxlan"
    cidr        = "192.168.3.0/24"
    ip_version  = 4
    dns_ip      = "8.8.8.8,8.8.4.4"
  }
}
variable "azlab_segment_octavia" {
  type = map(string)
  default = {
    subnet_name = "azlab_segment_octavia"
    cidr        = "192.168.4.0/24"
    ip_version  = 4
    dns_ip      = "8.8.8.8,8.8.4.4"
  }
}

##############
#### NOVA ####
##############


variable "deployer" {
  description = "Deploy node"
  default = {
    name = "azlab-deployer"
    image = "Ubuntu 20.04 Focal Fossa 20200423"
    flavor = "4C-12GB"
  }
}

#### LB

variable "loadbalancers_flavor" {
  type = string
  default = "8C-24GB-50GB"
}

variable "loadbalancers_image" {
  type = string
  default = "Ubuntu 20.04 Focal Fossa 20200423"
}

variable "loadbalancers" {
  description = "Load balancers"
  default = {
    lb0 = {
      mgmtIP  = "192.168.1.10",
      storageIP  = "192.168.2.10",
      vxlanIP  = "192.168.3.10",
      octaviaIP  = "192.168.4.10"
    },
    lb1 = {
      mgmtIP   = "192.168.1.11",
      storageIP  = "192.168.2.11",
      vxlanIP  = "192.168.3.11",
      octaviaIP  = "192.168.4.11"
    },
    lb2 = {
      mgmtIP   = "192.168.1.12",
      storageIP  = "192.168.2.12",
      vxlanIP  = "192.168.3.12",
      octaviaIP  = "192.168.4.12"
    },
  }
}

#### Controllers

variable "controllers_flavor" {
  type = string
  default = "8C-24GB-500GB"
}

variable "controllers_image" {
  type = string
  default = "Ubuntu 20.04 Focal Fossa 20200423"
}

variable "controllers" {
  description = "OpenStack Controller"
  default = {
    ctrl0 = {
      mgmtIP  = "192.168.1.20",
      storageIP  = "192.168.2.20",
      vxlanIP  = "192.168.3.20",
      octaviaIP  = "192.168.4.20"
    },
    ctrl1 = {
      mgmtIP   = "192.168.1.21",
      storageIP  = "192.168.2.21",
      vxlanIP  = "192.168.3.21",
      octaviaIP  = "192.168.4.21"
    },
    ctrl2 = {
      mgmtIP   = "192.168.1.22",
      storageIP  = "192.168.2.22",
      vxlanIP  = "192.168.3.22",
      octaviaIP  = "192.168.4.22"
    },
  }
}

### Computes

variable "computes_flavor" {
  type = string
  default = "8C-24GB-500GB"
}

variable "computes_image" {
  type = string
  default = "Ubuntu 20.04 Focal Fossa 20200423"
}

variable "computes" {
  description = "OpenStack Computes"
  default = {
    cpu0 = {
      mgmtIP  = "192.168.1.100",
      storageIP  = "192.168.2.100",
      vxlanIP  = "192.168.3.100",
      octaviaIP  = "192.168.4.100"
    },
    cpu1 = {
      mgmtIP   = "192.168.1.101",
      storageIP  = "192.168.2.101",
      vxlanIP  = "192.168.3.101",
      octaviaIP  = "192.168.4.101"
    },
    cpu2 = {
      mgmtIP   = "192.168.1.102",
      storageIP  = "192.168.2.102",
      vxlanIP  = "192.168.3.102",
      octaviaIP  = "192.168.4.102"
    },
  }
}

### Storages

variable "storages_flavor" {
  type = string
  default = "8C-24GB-500GB"
}

variable "storages_image" {
  type = string
  default = "Ubuntu 20.04 Focal Fossa 20200423"
}

variable "storages" {
  description = "Ceph Nodes"
  default = {
    stor0 = {
      mgmtIP  = "192.168.1.200",
      storageIP  = "192.168.2.200",
      vxlanIP  = "192.168.3.200",
      octaviaIP  = "192.168.4.200"
    },
    stor1 = {
      mgmtIP   = "192.168.1.201",
      storageIP  = "192.168.2.201",
      vxlanIP  = "192.168.3.201",
      octaviaIP  = "192.168.4.201"
    },
    stor2 = {
      mgmtIP   = "192.168.1.202",
      storageIP  = "192.168.2.202",
      vxlanIP  = "192.168.3.202",
      octaviaIP  = "192.168.4.202"
    },
  }
}
