#Creating Bucket
resource "google_storage_bucket" "website_bucket" {
  name          = var.bucket_name
  location      = "US-EAST1"
  force_destroy = true

  public_access_prevention = "inherited"

  uniform_bucket_level_access = false

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  cors {
    max_age_seconds = 5
  }

}
# Grant public access
resource "google_storage_default_object_access_control" "public_rule" {
  bucket = google_storage_bucket.website_bucket.name
  role   = "READER"
  entity = "allUsers"
}

#Upload index.html
resource "google_storage_bucket_object" "index" {
  name          = "index.html"
  source        = "website/index.html"
  bucket        = google_storage_bucket.website_bucket.name
  cache_control = "Cache-Control:public, max-age=5"
}
