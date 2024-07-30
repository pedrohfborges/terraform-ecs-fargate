provider "aws" {
  region  = "us-east-2"
  version = "~> 5.58.0"

}

terraform {
  backend "s3" {
    bucket  = var.bucket
    key     = "terraform-test.tfstate"
    region  = var.region
    encrypt = true
  }
  # request_timeout = "600s"

}
