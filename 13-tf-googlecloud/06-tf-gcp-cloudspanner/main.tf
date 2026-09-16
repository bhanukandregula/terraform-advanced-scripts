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

resource "google_spanner_instance" "techart-spanner-tf" {
  config                       = "regional-us-central1"
  name                         = "techart-spanner-tf"
  display_name                 = "Test Spanner Instance"
  num_nodes                    = 2
  edition                      = "STANDARD"
  default_backup_schedule_type = "AUTOMATIC"
  labels = {
    environment = "dev"
  }
}

resource "google_spanner_database" "database" {
  instance                 = google_spanner_instance.techart-spanner-tf.name
  name                     = "my-database"
  version_retention_period = "3d"
  default_time_zone        = "UTC"
  ddl = [
    "CREATE TABLE t1 (t1 INT64 NOT NULL,) PRIMARY KEY(t1)",
    "CREATE TABLE t2 (t2 INT64 NOT NULL,) PRIMARY KEY(t2)",
  ]
  deletion_protection = false
}
