resource "aws_key_pair" "keypair" {
    public_key = "${file("key/casetec_key.pub")}"
}

resource "aws_instance" "instances" {    
    count = 3

    ami = "ami-09d95fab7fff3776c"
    instance_type = "t2.micro"

    associate_public_ip_address = true

    subnet_id = "${element(aws_subnet.public_subnet.*.id, count.index)}"

    key_name = "${aws_key_pair.keypair.key_name}"

    vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]

    tags = {
        Name = "casetec_instances"
    }
}

output "public_ips" {
    value = "${join(", ", aws_instance.instances.*.public_ip)}"
}