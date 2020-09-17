variable "project_id" {
description = "Google Project."
type        = string
default     = "<Google Project ID>"
}

variable "bucket_name" {
description = "Dataflow Bucket name"
type        = string
default     = "deep-dive-dataflow-11223344"
}

variable "region" {
description = "Google Cloud region"
type        = string
default     = "us-central1"
}

variable "job_name" {
description = "Dataflow job name."
type        = string
default     = "deep-dive-dataflow"
}

resource "random_id" "job_id" {
 byte_length = 4
}

variable "terraform_backend" {
    description = "Terraform Backend location"
    type        = string
    default        = "gs://deep-dive-tfstate"
}
