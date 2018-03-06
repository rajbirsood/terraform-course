terraform {
	backend "s3" {
	bucket = "terraform-state-raj"
	key = "terraform/demo4"
	}
}
