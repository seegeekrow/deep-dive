terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  version = "3.5.0"

  credentials = file("../../deep-dive-dataflow.json")

  project = "learning-dataflow-289320"
  region  = "us-central1"
  zone    = "us-central1-c"
}