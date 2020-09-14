
terraform {
backend "gcs" {
  credentials = "deep-dive-dataflow.json"
  bucket = "static-state-289320"   # GCS bucket name to store terraform tfstate
  prefix = "deep-dive"           # Update to desired prefix name. Prefix name should be unique for each Terraform project having same remote state bucket.
  }
}