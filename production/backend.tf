terraform {
  backend "gcs"{
    bucket      = "gs://deep-dive-tfstate"
    prefix      = "prod"
  }
}