
resource "google_dataflow_job" "big_data_job" {
  name              = var.job_name
  template_gcs_path = "gs://dataflow-templates/latest/Word_Count"
  temp_gcs_location = "gs://${var.bucket_name}/temp"
  parameters = {
    inputFile = "gs://${var.bucket_name}/${google_storage_bucket_object.book.name}"
    output = "gs://${var.bucket_name}/output"
  }
  depends_on = [google_storage_bucket_object.book]
}
