variable "credentials" {
  description = "my creds"
  default     = "./keys/my-creds.json"
}

variable "project" {
  description = "My Project"
  default     = "dtc-de-course-412904"
}

variable "region" {
  description = "My Project Region"
  default     = "us-central1"
}


variable "location" {
  description = "My dataset location"
  default     = "US"
}


variable "bq_dataset_name" {
  description = "My BigQ dataset name"
  default     = "demo_dataset"
}

variable "gcs_bucket_name" {
  description = "Bucket name"
  default     = "dtc-de-course-412904-terra-bucket"
}

variable "gcs_storage_class" {
  description = "Bucket storage class"
  default     = "STANDARD"
}