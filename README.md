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
- [x] Create bucket and upload data with Terraform
- [x] Bonus: maybe save state in GCS backend. :boom: :microphone: :droplet:
- [x] Trigger Dataflow/Apache Beam job with ~Cloud Function~ Terraform
- [x] Output to GCS ~and send Errors to Pub/Sub~
- [x] Build Dashboard for job metrics in Stackdriver.
- [ ] Bonus: create dashboard with Terraform on-demand
- [ ] Errors in Pub/Sub could be picked up to by cloud function to rerun job.
- [ ] Setup Vault to store credentials

# Installation
Clone the repo, add secrets, -shake- stir, and serve over ice.
- Clone repo locally.
- Set variables in the `variables.tf`
- Make sure `terraform` is installed in path
## Run the following
- `terraform init`
- `terraform plan --out 1.plan`
- `terraform apply 1.plan`

# Notes
Libations recommended.
- ~https://www.beeradvocate.com/beer/profile/1199/493129/~
- https://www.beeradvocate.com/beer/profile/1199/79271/

## Scoping
Initially, my thought was to have this done through Dataflow, Pub/Sub, GCS, and Cloud Functions. But as I
dug into the what I could do with Terraform a bit deeper, the more it seemed there wasn't a need to add 
layers where terrform could already handle it.

After some testing of functionality between an instance in GCE versus a Dataflow template and having storage in GCS; the most direct route was to run jobs through dataflow templates. There are numerous options out of the box and the ability to write custom ones. Further, with Terraform, these templates can be called and run. 

## Metrics
The Monitoring offering in GCP is suffcient in this use case. It can provide metrics around the pipeline jobs and infrastruture elements. In a more complex setup, it would be a better choice to collect the metrics in a different system. This could be a simple as exporting to Big Query and fronting it with Grafana or sending the data to a more robust system. The idea, though, would be to have a way to alert and action metrics from disparate sources. 
