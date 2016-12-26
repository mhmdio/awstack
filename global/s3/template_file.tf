data "template_file" "s3-ro" {
  template = "${file("${path.module}/templates/policy.s3-ro.tpl")}"
  vars {
    bucket_name= "${var.dev_bucket_name}"
    }
}

data "template_file" "s3-rw" {
  template = "${file("${path.module}/templates/policy.s3-rw.tpl")}"
  vars {
    bucket_name= "${var.dev_bucket_name}"
    }
}

data "template_file" "s3-prod-bucket" {
  template = "${file("${path.module}/templates/policy.s3-prod-bucket.tpl")}"
  vars {
    bucket_name= "${var.prod_bucket_name}"
    bucket_user= "${var.prod_bucket_user}"
    }
}

data "template_file" "s3-dev-bucket" {
  template = "${file("${path.module}/templates/policy.s3-dev-bucket.tpl")}"
  vars {
    bucket_name= "${var.dev_bucket_name}"
    bucket_user= "${var.dev_bucket_user}"
    }
}
