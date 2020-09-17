terraform {
  backend "gcs"{
    bucket      = "deep-dive-tfstate"
    prefix      = "prod"
    credentials = "../../deep-dive-dataflow.json"
  }
}