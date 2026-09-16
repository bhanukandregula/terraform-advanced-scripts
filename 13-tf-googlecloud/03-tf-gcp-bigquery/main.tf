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

resource "google_bigquery_dataset" "dataset_name" {
  dataset_id                  = "ford_motor_people_dataset"
  friendly_name               = "ford_people"
  description                 = "This is a dataset for ford motor people"
  location                    = "US"
  default_table_expiration_ms = 3600000
}

resource "google_bigquery_table" "table_name" {
  dataset_id = google_bigquery_dataset.dataset_name.dataset_id
  table_id   = "ford_people_table"
}


