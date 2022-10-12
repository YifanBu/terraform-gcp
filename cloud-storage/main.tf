resource "google_storage_bucket" "GCS" {
  
  name = "bucket-from-terraform-10122022"
  storage_class = "NEARLINE"
  location = "US-CENTRAL1"
  labels = {
    "env" = "tf_env"
    "dep" = "complience"
  }
  uniform_bucket_level_access = true

  lifecycle_rule {
    condition {
      age = 5
    }
    action {
      type = "SetStorageClass"
      storage_class = "COLDLINE"
    }
  }

  retention_policy {
    is_locked = true
    retention_period = 864000
  }

}

resource "google_storage_bucket_object" "picture" {
  name = "Jeremy"
  bucket = google_storage_bucket.GCS.name
  source = "JC.png"
}