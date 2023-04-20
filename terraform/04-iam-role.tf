data "aws_iam_policy_document" "ec2-s3-read-only-policy-kthong" {
  statement {
    actions = ["sts:AssumeRole"]

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

resource "aws_iam_role_policy_attachment" "EC2S3ReadOnly_kthong-attach" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  role       = aws_iam_role.EC2S3ReadOnly_kthong.name
}

data "aws_iam_policy_document" "EC2PowerUser_policy_kthong" {
  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::021544540902:role/CCOE"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "EC2PowerUser_kthong" {
  name = "EC2PowerUser_kthong"
  assume_role_policy = data.aws_iam_policy_document.EC2PowerUser_policy_kthong.json
  tags = {
    "contractors-assume-role" : true
  }
}

resource "aws_iam_role_policy_attachment" "AmazonEC2FullAccess_kthong-attach" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  role       = aws_iam_role.EC2PowerUser_kthong.name
}