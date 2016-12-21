resource "template_file" "s3-ro" {
  filename = "policy.s3-ro.tpl"
  vars {
    bucket_name= "${var.bucket_name}"
  }
}

resource "template_file" "s3-rw" {
  filename = "policy.s3-rw.tpl"
  vars {
    bucket_name= "${var.bucket_name}"
  }
}

resource "template_file" "s3-principal" {
  filename = "policy.s3-principal.tpl"
  vars {
    bucket_name= "${var.bucket_name}"
  }
}


