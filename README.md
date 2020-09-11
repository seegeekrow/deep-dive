# deep-dive
A Terraform pipeline for GCP Dataflows with Stackdriver monitoring

# Overview
Develop infrastructure as code using terraform/Cloud deployment manager for deploying a datapipeline using dataflow. This code should create following resources :

1) Create Dataflow instance and deploy code to that instance, for dataflow code examples please refer to https://cloud.google.com/dataflow/docs/samples

2) use different metrics as service level indicators (SLIs) to gauge different SLOs. Setup Monitoring/Alerting/Dashboard using Stack driver to achieve it.
-Infrastructure metrics for pipeline performance
-Pipeline metrics for system lag and data correctness
-Pipeline logs and errors for code defects and unanticipated behavior


