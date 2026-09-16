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

# Reddis and MemCache
# Google Cloud Memorystore for Redis API - Must be enabled before we can create a Redis instance
resource "google_redis_instance" "techart-redis-cache" {
  name                = "techart-redis-cache-instance"
  memory_size_gb      = 1
  deletion_protection = false
  tier                = "BASIC"
  location_id         = "us-central1-a"

  lifecycle {
    prevent_destroy = true
  }
}
