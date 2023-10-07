terraform {
  required_version = "~> 1.5.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.12.0"
    }
  }

  backend "s3" {
    bucket = "tf-states-master-devops"
    key    = "infra/terraform.tfstate"
    region = "eu-north-1"
  }

}

provider "aws" {
  region = "eu-north-1"
  default_tags {
    tags = {
      project     = var.project-name
      environment = terraform.workspace
    }
  }
}
