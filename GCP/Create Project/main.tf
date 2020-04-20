provider "google" {
  region  = "us-east1"
  project = "default-project-160900"
}
resource "google_project" "trainee" {
  count           = "${length(var.trainees)}"
  name            = "trainee-${element(random_id.trainee.*.hex, count.index)}"
  project_id      = "trainee-${element(random_id.trainee.*.hex, count.index)}"
  billing_account = "${var.billing_id}"
  org_id          = "${var.org_id}"
}