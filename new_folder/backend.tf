  terraform {
  backend "s3" {
    bucket = "terraform-class-june-gaukhar"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}