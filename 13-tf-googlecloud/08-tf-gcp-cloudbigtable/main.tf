terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "8.3.0"
    }
  }
}

provider "google" {
  # Configuration options
  project     = "buoyant-aloe-220514"
  region      = "us-central1"
  zone        = "us-central1-a"
  credentials = file("terraform-keys.json")
}

resource "google_bigtable_instance" "techart-bigtable-instance" {
  name = "techart-bigtable-instance"

  cluster {
    cluster_id   = "techart-bigtable-cluster"
    num_nodes    = 1
    storage_type = "HDD"
  }

  labels = {
    my-label = "techart-label"
  }
}

resource "google_bigtable_table" "techart-bigtable-table" {
  name          = "techart-bigtable-table"
  instance_name = google_bigtable_instance.techart-bigtable-instance.name

  column_family {
    family = "cf1"
  }
}


