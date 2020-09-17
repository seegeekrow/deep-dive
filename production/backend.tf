terraform {
  backend "gcs"{
    bucket      = "deep-dive-tfstate"
    prefix      = "prod"
    # replace this file 
    credentials = "../../deep-dive-dataflow.json"
  }
}
