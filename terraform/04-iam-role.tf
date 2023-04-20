data "aws_iam_policy_document" "ec2-s3-read-only-policy-kthong" {
  statement {
    actions = ["AmazonS3ReadOnlyAccess"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "EC2S3ReadOnly_kthong" {
  name               = "EC2S3ReadOnly_kthong"
  assume_role_policy = data.aws_iam_policy_document.ec2-s3-read-only-policy-kthong.json
}