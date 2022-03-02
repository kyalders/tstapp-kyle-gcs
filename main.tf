resource "google_kms_key_ring" "keyring" {
  name     = "keyring-test"
  location = "global"
  project = var.project_id
}
