terraform {
  backend "gcs" {
    bucket = "statefile-bucket-of-my-project"
    prefix = "terraform/state"
  }
}