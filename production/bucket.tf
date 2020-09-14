resource "google_storage_bucket" "dataflow-jobs" {
  name          = var.bucket_name
  location      = var.region

}

resource "google_storage_bucket_object" "data-file" {
  name   = "input/COVID-19_Historical_Data_Table.json"
  source = "/home/karl/source/deep-dive/data/COVID-19_Historical_Data_Table.json"
  bucket = var.bucket_name

  depends_on = [google_cloudfunctions_function.function]
}
