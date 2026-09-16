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
  # buoyant-aloe-220514 this is our active project ID
  project = "buoyant-aloe-220514"
  region  = "us-central1"
  zone    = "us-central1-a"
}

resource "google_storage_bucket" "my_bucket_gcs1" {
  name     = "my-unique-bucket-techart-tf-12345"
  location = "US"
}
