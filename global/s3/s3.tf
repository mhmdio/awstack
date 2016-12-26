
# Defines a user that should be able to write to your prod bucket
resource "aws_iam_user" "prod_user" {
    name = "${var.prod_bucket_user}"
}

resource "aws_iam_access_key" "prod_user" {
    user = "${aws_iam_user.prod_user.name}"
}

resource "aws_iam_user_policy" "prod_user_rw" {
    name = "prod_user_policy"
    user = "${aws_iam_user.prod_user.name}"
    policy = "${data.template_file.s3-rw.rendered}"
}

resource "aws_iam_user" "dev_user" {
    name = "${var.dev_bucket_user}"
}

resource "aws_iam_access_key" "dev_user" {
    user = "${aws_iam_user.dev_user.name}"
}

resource "aws_iam_user_policy" "dev_user_ro" {
    name = "dev_user_policy"
    user = "${aws_iam_user.dev_user.name}"
    policy = "${data.template_file.s3-ro.rendered}"
}

resource "aws_s3_bucket" "prod_bucket" {
    bucket = "${var.prod_bucket_name}"
    acl = "public-read"

    cors_rule {
        allowed_headers = ["*"]
        allowed_methods = ["PUT","POST"]
        allowed_origins = ["*"]
        expose_headers = ["ETag"]
        max_age_seconds = 3000
    }

    policy = "${data.template_file.s3-prod-bucket.rendered}"
}

resource "aws_s3_bucket" "dev_bucket" {
    bucket = "${var.dev_bucket_name}"
    acl = "public-read"

    cors_rule {
        allowed_headers = ["*"]
        allowed_methods = ["PUT","POST"]
        allowed_origins = ["*"]
        expose_headers = ["ETag"]
        max_age_seconds = 3000
    }

    policy = "${data.template_file.s3-dev-bucket.rendered}"
}
