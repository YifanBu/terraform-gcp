terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.40.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "terraform-project-365304"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = "keys.json"
}