resource "aws_s3_bucket" "foo-bucket" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
  versioning {
    enabled = true
  }
}


resource "aws_s3_bucket" "foo-bucket_log_bucket" {
  bucket = "foo-bucket-log-bucket"
}

resource "aws_s3_bucket_logging" "foo-bucket" {
  bucket = aws_s3_bucket.foo-bucket.id

  target_bucket = aws_s3_bucket.foo-bucket_log_bucket.id
  target_prefix = "log/"
}

