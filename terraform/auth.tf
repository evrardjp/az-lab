resource "openstack_compute_keypair_v2" "user_key" {
  name       = "azlab--user-key"
  public_key = var.sshkey
}


resource "openstack_compute_secgroup_v2" "ssh" {
  name = "ssh"
  description = "allow ssh access from anywhere"
  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}

resource "openstack_compute_secgroup_v2" "icmp" {
  name = "icmp"
  description = "allow icmp access from anywhere"
  rule {
    from_port   = -1
    to_port     = -1
    ip_protocol = "icmp"
    cidr        = "0.0.0.0/0"
  }
}
