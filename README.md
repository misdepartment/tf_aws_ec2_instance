ec2_instance terraform module
=======================

A terraform module for making ec2 instances.
* Assumes you're making your instances in a VPC.

Module Input Variables
----------------------

- `ami_id` - The AMI to use
- `subnet_id` - The VPC subnet to place the instance in
- `instance_type` - The EC2 instance type, e.g. m1.small
- `user_data` - cloud-init script to pass to instance user data
- `iam_instance_profile` - Instance profile name to associate to the instance
- `key_name` - SSH key pair name to associate to the instance
- `source_dest` - True/false for source/dest check
- `associate_public_ip` - True/false for associating a public ip
- `ebs_optimized` - True/false to enable EBS optimization
- `root_block_type` - Type of volume for root block (standard, gp2, etc)
- `root_block_size` - Size in GB of root volume
- `security_groups` - List of security groups to associate
- `tags` - A map for setting AWS tags.
- `instance_name` - Name to give the instance

Usage
-----

You can use this in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. `main.tf`

```
module "ec2_instance" {
  source = "github.com/misdepartment/tf_aws_ec2_instance"
  
  instance_type = "${var.instance_type}"
  instance_name = "${var.app_name}"
  ami_id = "${var.ami_id}"
  subnet_id = "${var.subnet_id}"
  user_data = "${data.template_file.user_data.rendered}"
  instance_profile = "${module.instance_profile.default_profile_id}"
  key_name = "${var.key_name}"
  source_dest = "false"
  security_groups = ["${module.security_groups.default_sg_id}"]
  ebs_optimized = "true"
  root_block_type = "${var.root_block_type}"
  root_block_size = "${var.root_block_size}"
}
```

2. Setting values for the following variables, either through `terraform.tfvars` or `-var` arguments on the CLI

- instance_name
- instance_type
- subnet_id
- ami_id
- iam_instance_profile
- key_name
- source_dest
- associate_public_ip
- ebs_optimized
- root_block_type
- root_block_size
- security_groups
- tags

3. Creating a user_data file and referencing with `${file("path/to/user_data.yml")}`

Authors
=======

Created and maintained by [Brandon Burton](https://github.com/solarce)
(brandon@inatree.org).

Expanded by `thepastelsuit`

License
=======

Apache 2 Licensed. See LICENSE for full details.
