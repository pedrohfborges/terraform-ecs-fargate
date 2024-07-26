provider "aws" {
  region  = "us-east-2"
  version = "~> 5.58.0"

}

terraform {
  backend "s3" {
    bucket  = "pedrobucket26"
    key     = "terraform-test.tfstate"
    region  = "us-east-2"
    encrypt = true
  }
  # request_timeout = "600s"

}