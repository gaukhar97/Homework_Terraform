resource "null_resource" "commands1" {
  depends_on = ["aws_instance.VPC"]

  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "remote-exec" {
    connection {
      host        = "${aws_instance.VPC.public_ip}"
      type        = "ssh"
      user        = "centos"
      private_key = "${file("~/.ssh/id_rsa")}"
    }

    inline = [
      "sudo yum install httpd -y",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
    ]
  }
}
