resource "aws_key_pair" "due1-test-key" {
  key_name   = "due1-test-key"
  public_key = "${file("${var.aws_ssh_due1_test_key}.pub")}"
}

