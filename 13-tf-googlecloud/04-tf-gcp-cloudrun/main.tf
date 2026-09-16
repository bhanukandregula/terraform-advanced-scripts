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

resource "google_cloud_run_service" "cloudrun-techart-tf" {
  name     = "cloudrun-techart2"
  location = "us-central1"

  template {
    spec {
      containers {
        # image = "gcr.io/google-samples/hello-app:1.0"
        image = "gcr.io/google-samples/hello-app:2.0"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

data "google_iam_policy" "admin" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "policy" {
  service  = google_cloud_run_service.cloudrun-techart-tf.name
  location = google_cloud_run_service.cloudrun-techart-tf.location
  # project     = google_cloud_run_service.cloudrun-techart-tf.project
  policy_data = data.google_iam_policy.admin.policy_data
}




