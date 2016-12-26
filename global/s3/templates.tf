data "template_file" "s3-ro" {
  template = "${file("${path.module}/templates/policy.s3-ro.tpl")}"
  vars {
    bucket_name= "${var.test_bucket_name}"
    }
}

data "template_file" "s3-rw" {
  template = "${file("${path.module}/templates/policy.s3-rw.tpl")}"
  vars {
    bucket_name= "${var.test_bucket_name}"
    }
}

data "template_file" "s3-principal" {
  template = "${file("${path.module}/templates/policy.s3-principal.tpl")}"
  vars {
    bucket_name= "${var.test_bucket_name}"
    }
}
