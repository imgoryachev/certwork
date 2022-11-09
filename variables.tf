variable "instance_name" {
        description = "Instance name"
        default = "pc1"
}

variable "instance_type" {
        default = "t2.micro"
}

variable "subnet_id" {
        description = "VPC subnet"
        default = "subnet-0c3b88d08d2ebd335"
}

variable "ami_id" {
        description = "AMI"
        default = "ami-08c40ec9ead489470"
}

variable "number_of_instances" {
        description = "number of instances"
        default = 1
}


variable "ami_key_pair_name" {
        default = "main-key"
}