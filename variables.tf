// Module specific variables

variable "instance_name" {
  description = "Used to populate the Name tag. This is done in main.tf"
}

variable "instance_type" {}
variable "instance_profile" {}

variable "subnet_id" {
  description = "The VPC subnet the instance(s) will go in"
}

variable "ami_id" {
  description = "The AMI to use"
}

variable "user_data" {
  description = "The path to a file with user_data for the instances"
}

variable "tags" {
  default = {
    created_by = "terraform"
 }
}

variable "key_name" {
  default = ""
}
variable "source_dest" {
  default = true
}
variable "public_ip" {
  default = true
}
variable "security_groups" {
  type = "list"
  default = []
}
