resource "google_storage_bucket" "my_bucket_gcs1" {
  name          = "my-unique-bucket-techart-tf-1234567890"
  storage_class = "NEARLINE"
  location      = "US"

  labels = {
    environment = "dev"
    team        = "techart"
  }

  uniform_bucket_level_access = true

  lifecycle_rule {
    action {
      type          = "SetStorageClass"
      storage_class = "COLDLINE"
    }
    condition {
      age = 5
    }
  }

  retention_policy {
    is_locked        = true
    retention_period = 864000
  }
}


resource "google_storage_bucket_object" "my_bucket_picture" {
  name   = "my_picture.png"
  bucket = google_storage_bucket.my_bucket_gcs1.name
  source = "my_picture.png"
}
