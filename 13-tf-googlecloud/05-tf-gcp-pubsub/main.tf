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

resource "google_pubsub_topic" "techart-topic-tf" {
  name = "techart-topic-tf"
}

resource "google_pubsub_subscription" "techart-subscription-tf" {
  name  = "techart-subscription-tf"
  topic = google_pubsub_topic.techart-topic-tf.id
}







