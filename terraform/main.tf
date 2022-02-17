terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.44.0"
    }
  }
  required_version = "> 0.14"
}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "app_inbound" {
  tags = {
    Name = "App Bucket"
  }

  bucket = "${var.app}.${var.label_inbound}"
  acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = false
  }
}

resource "aws_s3_bucket" "app_outbound" {
  tags = {
    Name = "App Bucket"
  }

  bucket = "${var.app}.${var.label_outbound}"
  acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = false
  }
}