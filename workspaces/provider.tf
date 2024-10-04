terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "remote-state-tfr"
    key    = "workspace-demo"
    region = "us-east-1"
    dynamodb_table = "lock-tfr"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
