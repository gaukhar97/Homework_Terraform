resource "null_resource"  "commands" {
    depends_on = ["aws_instance.Jenkins"]
    triggers = {
        always_run = "${timestamp()}"
    }
    # Push files  to remote server
    # provisioner "file" {
    #     connection {
    #     host = "${aws_instance.Jenkins.public_ip}"
    #     type = "ssh"
    #     user = "centos"
    #     private_key = "${file("~/.ssh/id_rsa")}"
    #     }
    #     source      = "r1soft.repo"
    #     destination = "/tmp/r1soft.repo"
    # }
    # Execute linux commands on remote machine
    provisioner "remote-exec" {
        connection {
        host = "${aws_instance.Jenkins.public_ip}"
        type = "ssh"
        user = "centos"
        private_key = "${file("~/.ssh/id_rsa")}"
    }
    inline = [
        "sudo yum install epel-release -y",
        "sudo yum install java-1.8.0-openjdk-devel -y",
        "sudo yum install wget -y",
        "curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo",
        "sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key",
        "sudo yum install jenkins -y",
        "sudo systemctl start jenkins",
        ]
    }
}