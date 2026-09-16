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

resource "google_sql_database_instance" "techart-instance" {
  name             = "my-database-instance"
  region           = "us-central1"
  database_version = "MYSQL_8_4"
  settings {
    tier    = "db-f1-micro"
    edition = "ENTERPRISE"
  }

  deletion_protection = false
}

resource "google_sql_database" "techart-database" {
  name     = "my-database"
  instance = google_sql_database_instance.techart-instance.name
}


