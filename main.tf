// EC2 Instance Resource for Module
resource "aws_instance" "ec2_instance" {
    ami = "${var.ami_id}"
    subnet_id = "${var.subnet_id}"
    instance_type = "${var.instance_type}"
    user_data = "${var.user_data}"
    iam_instance_profile = "${var.instance_profile}"
    key_name = "${var.key_name}"
    source_dest_check = "${var.source_dest}"
    associate_public_ip_address = "${var.public_ip}"
    
    security_groups = "${var.security_groups}"
    
    tags {
        created_by = "${lookup(var.tags,"created_by")}"
        Name = "${var.instance_name}"
    }
}
