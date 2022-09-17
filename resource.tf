resource "aws_s3_bucket" "sss-bucket" {
  bucket = "my-sss-global-bucket"
 tags = {
  Name         = "MY BUCKET"
  Environment  = "Dev"
}
}
resource "aws_s3_bucket_policy" "allow_access_from_public" {
  bucket = aws_s3_bucket.sss-bucket.id
  policy = data.aws_iam_policy_document.allow_access_from_public.json
}

data "aws_iam_policy_document" "allow_access_from_public" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.sss-bucket.arn,
      "${aws_s3_bucket.sss-bucket.arn}/*",
    ]
  }
}

