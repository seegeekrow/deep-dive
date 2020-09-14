provider "google" {
  #credentials = "deep-dive-dataflow.json"
  project     = var.project_id
  region      = var.region
}

resource "google_storage_bucket" "dataflow-jobs" {
  name          = var.bucket_name
  location      = var.region
  force_destroy = true

  uniform_bucket_level_access = true
}

resource "google_storage_bucket" "static-state" {
  name          = var.static_state_bucket_name
  location      = var.region
  force_destroy = true

  uniform_bucket_level_access = true
}