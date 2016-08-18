// Configure the Google Cloud provider
provider "google" {
  credentials = "${file("terraform-practice-e946e53c86c3.json")}"
  project     = "terraform-practice"
  region      = "us-central1"
}

// Create a new instance
resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "f1-micro"
  zone         = "us-central1-c"

  tags = ["foo", "bar"]

  disk {
    image = "ubuntu-1604-xenial-v20160721"
  }

  // Local SSD disk
  //disk {
  //  type    = "pd-standard"
  //  scratch = true
  //}

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }
}
