resource "aws_instance" "docker" {
   ami = "${data.aws_ami.ubuntu_ami.id}"
   instance_type = "t2.micro"
   subnet_id = "${aws_subnet.public-a.id}"
   associate_public_ip_address = true
   key_name = "jellin"
   vpc_security_group_ids=["${aws_security_group.web.id}"]
   iam_instance_profile = "${aws_iam_instance_profile.web_profile.name}"
   user_data = "${file("docker.sh")}"

}

##Lookup AMI

data "aws_ami" "ubuntu_ami" {
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu-trusty-14.04-amd64-server*"]
  }
}