variable "credentials" {
  default = "../redislabs-sa-training-services-b906188fc804.json"
}

variable "var_project" {
  default = "redislabs-sa-training-services"
}

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-a"
}

variable "os" {
  # default = "rhel-cloud/rhel-8-v20210316"
  #default = "centos-cloud/centos-7-v20200205"
  #default = "ubuntu-os-cloud/ubuntu-2004-focal-v20230302"
  default = "ubuntu-os-cloud/ubuntu-2204-jammy-v20220420"
}

variable "vpc" {
  default = "analytic"
}

variable "gce_ssh_user" {
  default = "root"
}

variable "gce_ssh_pub_key_file" {
  default = "~/.ssh/id_rsa.pub"
}

variable "gce_ssh_private_key_file" {
  default = "~/.ssh/id_rsa"
}

variable "gce_public_subnet_cidr" {
  default = "10.101.70.128/25"
}

variable "gce_private_subnet_cidr" {
  default = "192.168.1.0/24"
}


variable "boot_disk_size" {
  default = 50
}


variable "bastion-ip-address-count" {
  default = 1
}


######  machine count ######
variable "node_machine_count" {
  default = 4
}

variable "kube_storage_machine_count" {
  default = 4
}

variable "bastion_machine_type" {
  default = "n1-standard-1"
}

variable "node_machine_type" {
  default = "n2-standard-4"
}



