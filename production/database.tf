resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = "deep_dive"
  friendly_name               = "deep_dive_output"
  description                 = "This is a test description"
  location                    = "US"
  default_table_expiration_ms = 3600000

}

resource "google_bigquery_table" "default" {
  dataset_id = google_bigquery_dataset.dataset.dataset_id
  table_id   = "WordCount"

  labels = {
    env = "default"
  }

  schema = <<EOF
[
  {
    "name": "word",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "Word in material"
  },
  {
    "name": "count",
    "type": "INT64",
    "mode": "NULLABLE",
    "description": "Count of words in the work"
  }
]
EOF

}