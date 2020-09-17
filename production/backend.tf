terraform {
  backend "gcs"{
    bucket      = "gs://deep-dive-tfstate"
    prefix      = "prod"
    credentials = file("../../deep-dive-dataflow.json")
  }
}