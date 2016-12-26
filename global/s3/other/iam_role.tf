#resource "aws_iam_instance_profile" "test-profile" {
#  name = "tf-test-profile"
#  roles = [
#    "${aws_iam_role.s3-ro.name}",
#    "${aws_iam_role.s3-rw.name}"
#  ]
#}

variable "bucket_name" { default = "tf-test-bucket" }

resource "aws_iam_role" "s3-ro" {
  name = "tf-test-s3-ro"
  path = "/"
  assume_role_policy = "${template_file.s3-principal.rendered}"
}

resource "aws_iam_role_policy" "s3-ro" {
  name = "tf-test-s3-ro"
  role = "${aws_iam_role.s3-ro.id}"
  policy = "${template_file.s3-ro.rendered}"
}

resource "aws_iam_role" "s3-rw" {
  name = "tf-test-s3-rw"
  path = "/"
  assume_role_policy = "${template_file.s3-principal.rendered}"
}

resource "aws_iam_role_policy" "s3-rw" {
  name = "tf-test-s3-rw"
  role = "${aws_iam_role.s3-rw.id}"
  policy = "${template_file.s3-rw.rendered}"
}

