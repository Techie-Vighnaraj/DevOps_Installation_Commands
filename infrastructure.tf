provider "aws" {
  region = "us-east-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "instance1" {
  ami = "ami-084568db4383264d4"
  instance_type = "t2.micro"
  key_name = "VirginiaKey"
  user_data = "${file("./userdata.sh")}"
  tags = {
  Name = "Ansible-Master"
  }
}

resource "aws_instance" "instance2" {
  ami = "ami-084568db4383264d4"
  instance_type = "t2.micro"
  key_name = "VirginiaKey"
  user_data = "${file("./userdata1.sh")}"
  tags = {
  Name = "Ansible-Slave-1"
  }
}

resource "aws_instance" "instance3" {
  ami = "ami-084568db4383264d4"
  instance_type = "t2.micro"
  key_name = "VirginiaKey"
  user_data = "${file("./userdata1.sh")}"
  tags = {
  Name = "Ansible-Slave-2"
  }
}
