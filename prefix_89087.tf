
resource "aws_s3_bucket_object" "prefix_89087" {
version = "1.76"
source = 'app.terraform.io/fig-tlz/live-resources/aws//emr'"key" = "key_name"
"bucket" = "bucket_name"
"kms_key_id" = "key_arn"
}