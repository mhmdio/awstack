variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}

provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region     = "${var.aws_region}"
}

resource "aws_iam_user" "lb" {
    name = "tf-test-loadbalancer"
    path = "/system/"
}

resource "aws_iam_access_key" "lb" {
    user = "${aws_iam_user.lb.name}"
}

resource "aws_iam_user_policy" "lb_ro" {
    name = "tf-test"
    user = "${aws_iam_user.lb.name}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

