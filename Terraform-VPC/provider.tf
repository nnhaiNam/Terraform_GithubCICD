terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.75.0"
    }
  }

    backend "s3" {
    bucket = "mybucketofnemnem"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
  
}

provider "aws" {
  region = "us-east-1"
}