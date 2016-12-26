data "template_file" "s3-ro" {
  template = "${file("${path.module}/templates/policy.s3-ro.tpl")}"
  vars {
    bucket_name= "${var.bucket_name}"
    }
}

resource "template_file" "s3-ro" {
  filename = "./templates/policy.s3-ro.tpl"
  vars {
    bucket_name= "${var.bucket_name}"
  }
}

resource "template_file" "s3-rw" {
  filename = "./templates/policy.s3-rw.tpl"
  vars {
    bucket_name= "${var.bucket_name}"
  }
}

resource "template_file" "s3-principal" {
  filename = "./templates/policy.s3-principal.tpl"
  vars {
    bucket_name= "${var.bucket_name}"
  }
}
