resource "aws_s3_bucket" "backend" {
  bucket = "moonlight-tf-state"
  region = "eu-west-1"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    "rule" {
      "apply_server_side_encryption_by_default" {
        sse_algorithm = "AES256"
      }
    }
  }

  tags {
    Name        = "moonlight-tf-state"
    Environment = "prod"
    project     = "moonlight"
  }
}
