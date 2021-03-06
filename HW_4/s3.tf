resource "aws_s3_bucket" "S3" {
  bucket = "imankulova-s3-bucket"
}
resource "aws_s3_bucket_policy" "b" {
  bucket = "${aws_s3_bucket.S3.id}"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "MYBUCKETPOLICY",
  "Statement": [
    {
      "Sid": "IPAllow",
      "Effect": "Allow",
      "Principal": "*",
      "Action": ["s3:GetObject","s3:GetObjectVersion","s3:PutObject"],
      "Resource": "arn:aws:s3:::imankulova-s3-bucket/*",
      "Condition": {
         "IpAddress": {"aws:SourceIp": "8.8.8.8/32"}
      }
    }
  ]
}
POLICY
}