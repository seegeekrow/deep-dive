
resource "google_storage_bucket_object" "archive" {
  name   = "scripts/function-source.zip"
  bucket = var.bucket_name
  source = "scripts/function-source.zip"

  depends_on = [google_storage_bucket.dataflow-jobs]
}

resource "google_cloudfunctions_function" "function" {
  name        = "ddd-function"
  description = "Trigger Dataflow job from GCS bucket"
  runtime     = "python37"

  available_memory_mb   = 128
  source_archive_bucket = var.bucket_name
  source_archive_object = google_storage_bucket_object.archive.name
  event_trigger = {[
      event_type = "google.storage.object.finalize",
      resource = var.bucket_name
  ]}
  timeout               = 60
  entry_point           = "hello_gcs"

}
  /*
  environment_variables = {
    MY_ENV_VAR = "my-env-var-value"
  }
}
*/
# IAM entry for a single user to invoke the function
/*
resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.function.project
  region         = google_cloudfunctions_function.function.region
  cloud_function = google_cloudfunctions_function.function.name

  role   = "roles/cloudfunctions.invoker"
  member = "user:myFunctionInvoker@example.com"
}
*/