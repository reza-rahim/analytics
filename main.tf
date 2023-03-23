provider "google" {
  credentials = file(var.credentials)
  project     = var.var_project
  region      = var.region
  zone        = var.zone
}

resource "google_compute_network" "vpc" {
  name                    = var.vpc
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"

}


################################   ##subnet and route ##########################

resource "google_compute_subnetwork" "public-subnet" {
  name          = "${var.vpc}-public-subnet"
  network       = google_compute_network.vpc.name
  ip_cidr_range = var.gce_public_subnet_cidr
}

resource "google_compute_subnetwork" "private-subnet" {
  name          = "${var.vpc}-private-subnet"
  network       = google_compute_network.vpc.name
  ip_cidr_range = var.gce_private_subnet_cidr
}


resource "google_compute_router" "router" {
  name    = "${var.vpc}-router"
  region  = google_compute_subnetwork.private-subnet.region
  network = google_compute_network.vpc.self_link
  bgp {
    asn = 64514
  }
}


################################ nat  ############################

resource "google_compute_router_nat" "simple-nat" {
  name                               = "${var.vpc}-nat"
  router                             = google_compute_router.router.name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}


################################ fire wall ############################


resource "google_compute_firewall" "private-firewall" {
  name    = "${var.vpc}-private-firewall"
  network = google_compute_network.vpc.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "tcp"
     ports    = ["0-65535"]
  }

  source_ranges = [var.gce_public_subnet_cidr, var.gce_private_subnet_cidr, "130.211.0.0/22",  "35.191.0.0/16"]
}

resource "google_compute_firewall" "public-firewall" {
  name    = "${var.vpc}-public-firewall"
  network = google_compute_network.vpc.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "udp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22","80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}

########################### bastion ############################ 


resource "google_compute_address" "bastion-ip-address" {
  #count = var.bastion-ip-address-count
  #name  = "bastion-ip-address-${count.index}"
  name  = "${var.vpc}-bastion-ip-address"
}

resource "google_compute_instance" "bastion" {
  #count        = var.bastion-ip-address-count
  #name         = "bastion-${count.index}"
  name         = "${var.vpc}-bastion"
  machine_type = var.bastion_machine_type

  #can_ip_forward  = true

  tags = ["kubernetes-the-easy-way", "bastion"]

  boot_disk {
    initialize_params {
      image = var.os
      size  = var.boot_disk_size
    }
  }


  network_interface {
    subnetwork = google_compute_subnetwork.public-subnet.name

    #network_ip = "10.10.0.${count.index+4}"

    access_config {
      nat_ip  = google_compute_address.bastion-ip-address.address
      #nat_ip  = element(google_compute_address.bastion-ip-address.*.address, count.index)
    }
  }

  service_account {
    scopes = ["compute-rw", "storage-ro", "service-management", "service-control", "logging-write", "monitoring"]
  }

  metadata_startup_script = "sed -i 's/PermitRootLogin no/PermitRootLogin yes/' /etc/ssh/sshd_config; systemctl restart sshd; yum -y update; yum install -y git wget ansible; echo  'Host *\n \t StrictHostKeyChecking no' > ~/.ssh/config; apt update; apt install -y ansible "

  metadata = {
    sshKeys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }
}



##############################################################
resource "google_compute_disk" "storage-disk-c-" {
  count = var.kube_storage_machine_count
  name  = "${var.vpc}-storage-disk-c-${count.index}-data"
  type  = "pd-standard"
  zone  = var.zone
  size  = "1000"
}

resource "google_compute_disk" "storage-disk-d-" {
  count = var.kube_storage_machine_count
  name  = "${var.vpc}-storage-disk-d-${count.index}-data"
  type  = "pd-standard"
  zone  = var.zone
  size  = "1000"
}

resource "google_compute_disk" "storage-disk-e-" {
  count = var.kube_storage_machine_count
  name  = "${var.vpc}-storage-disk-e-${count.index}-data"
  type  = "pd-standard"
  zone  = var.zone
  size  = "1000"
}

resource "google_compute_disk" "storage-disk-f-" {
  count = var.kube_storage_machine_count
  name  = "${var.vpc}-storage-disk-f-${count.index}-data"
  type  = "pd-standard"
  zone  = var.zone
  size  = "1000"
}

########################### node ############################
resource "google_compute_instance" "node" {
  count        = var.node_machine_count
  name         = "node-${count.index+1}"
  machine_type = var.node_machine_type


  boot_disk {
    initialize_params {
      image = var.os
      size  = var.boot_disk_size
    }
  }


  network_interface {
    subnetwork = google_compute_subnetwork.private-subnet.name
    network_ip = "192.168.1.${count.index+4}"
  }

  service_account {
    scopes = ["compute-rw", "storage-ro", "service-management", "service-control", "logging-write", "monitoring"]
  }

  metadata = {
    sshKeys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }


  attached_disk {
    source      = element(google_compute_disk.storage-disk-c-.*.self_link, count.index)
    device_name = element(google_compute_disk.storage-disk-c-.*.name, count.index)
  }

  attached_disk {
    source      = element(google_compute_disk.storage-disk-d-.*.self_link, count.index)
    device_name = element(google_compute_disk.storage-disk-d-.*.name, count.index)
  }

  attached_disk {
    source      = element(google_compute_disk.storage-disk-e-.*.self_link, count.index)
    device_name = element(google_compute_disk.storage-disk-e-.*.name, count.index)
  }

  attached_disk {
    source      = element(google_compute_disk.storage-disk-f-.*.self_link, count.index)
    device_name = element(google_compute_disk.storage-disk-f-.*.name, count.index)
  }
  metadata_startup_script = "sed -i 's/PermitRootLogin no/PermitRootLogin yes/' /etc/ssh/sshd_config; systemctl restart sshd; yum -y update; yum install -y wget bind-utils ;"
}

####################### create ssh files  ####################### 



