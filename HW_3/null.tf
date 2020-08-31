resource "null_resource"  "commands" {
    depends_on = ["aws_instance.VPC"]
    triggers = {
        always_run = "${timestamp()}"
    }
    # Push files  to remote server
    provisioner "file" {
        connection {
        host = "${aws_instance.VPC.public_ip}"
        type = "ssh"
        user = "centos"
        private_key = "${file("~/.ssh/id_rsa")}"
        }
        source      = "r1soft.repo"
        destination = "/tmp/r1soft.repo"
    }
    # Execute linux commands on remote machine
    provisioner "remote-exec" {
        connection {
        host = "${aws_instance.VPC.public_ip}"
        type = "ssh"
        user = "centos"
        private_key = "${file("~/.ssh/id_rsa")}"
    }
    inline = [
        "sudo yum install -y epel-release -y",
        "sudo cp  /tmp/r1soft.repo  /etc/yum.repos.d/r1soft.repo",
        "sudo yum install serverbackup-enterprise -y",
        "sudo r1soft-setup --user admin --pass redhat --http-port 80 --https-port 443",
        "sudo /etc/init.d/cdp-server restart",
        ]
    }
}