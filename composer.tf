module "composer_service_account" {
  source     = "terraform-google-modules/service-accounts/google"
  version    = "~> 3.0"
  project_id = var.project_id
  prefix     = "${var.env}"
  names      = ["composer-sa"]
  project_roles = ["${var.project_id}=>roles/composer.worker",
  "${var.project_id}=>roles/iam.serviceAccountUser"]
}
