resource "null_resource"  "commands" {
    depends_on = ["aws_instance.NagiosXI"]
    triggers = {
        always_run = "${timestamp()}"
    }

     provisioner "remote-exec" {
        connection {
        host = "${aws_instance.NagiosXI.public_ip}"
        type = "ssh"
        user = "centos"
        private_key = "${file("~/.ssh/id_rsa")}"
    }
    inline = [
        "sudo yum install unzip  curl -y",
        "sudo curl https://assets.nagios.com/downloads/nagiosxi/install.sh | sudo sh",
        ]
    }
}