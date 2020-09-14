# deep-dive
A Terraform pipeline for GCP Dataflows with Stackdriver monitoring

# Overview
Develop infrastructure as code using terraform/Cloud deployment manager for deploying a datapipeline using dataflow. This code should create following resources :

1) Create Dataflow instance and deploy code to that instance, for dataflow code examples please refer to https://cloud.google.com/dataflow/docs/samples

2) use different metrics as service level indicators (SLIs) to gauge different SLOs. Setup Monitoring/Alerting/Dashboard using Stack driver to achieve it.
- Infrastructure metrics for pipeline performance
- Pipeline metrics for system lag and data correctness
- Pipeline logs and errors for code defects and unanticipated behavior

# Methodology
Build the pipeline:
- Create bucket and upload data with Terraform
-- ~Bonus: maybe save state in GCS backend.~
- Trigger Dataflow/Apache Beam job with ~Cloud Function~ Terraform
- Output to GCS ~and send Errors to Pub/Sub~
- Build Dashboard for job metrics in Stackdriver. 
- Errors in Pub/Sub could be picked up to by cloud function to rerun job.
# Installation
Clone the repo, add secrets, -shake- stir, and serve over ice.
- Clone repo locally.
- Set variables in the `variables.tf`
- Make sure `terraform` is installed in path
- Run
- `terraform init`
- `terraform plan --out 1.plan`
- `terraform apply 1.plan`

# Notes
Libations recommended.
https://www.beeradvocate.com/beer/profile/1199/493129/
