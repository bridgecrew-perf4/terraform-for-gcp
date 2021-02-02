// Configure the Google Cloud provider
provider "google" {
 project     = "<Project Name>"
 region      = "us-central1"
}
// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
 byte_length = 8
}

// A single Compute Engine instance
resource "google_compute_instance" "default" {
 name         = "ops-vm-${random_id.instance_id.hex}"
 machine_type = "n1-standard-1"
 zone         = "us-central1-a"
metadata = {
   ssh-keys = "${var.SSH_USER}:${file(var.SSH_CRED)}"
 }
 boot_disk {
   initialize_params {
     image = "debian-cloud/debian-9"
   }
 }

 metadata_startup_script = "sudo apt-get update"

 network_interface {
   network = "default"
 access_config {
   }
 }
}
// A variable for extracting the external IP address of the instance
output "ip" {
 value = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
}
