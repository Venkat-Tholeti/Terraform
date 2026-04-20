
variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
    description = "AMI ID of JoinDevops"
}

variable "instance_size" {
    default = "t3.micro"
}

variable "ec2_tags" {
    type = map(string)
    default = {
        Name = "Testing"
        Project = "Terraform"
    }
}

variable "sg_name" {
    default = "Test"
}

variable "sg_description" {
    default = "Terraform practice"
}

variable "from_port" {
    type = number
    default = 0
}

variable "to_port" {
    type = number
    default = 0
}

variable "cidr_block" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "sg_tags" {
    default = {
        Name = "Testing"
        Project = "Terraform"
    }
}

variable "environment" {
    default = "dev"
}

variable "instances" {
    default = ["mongodb", "redis", "mysql", "rabbitmq"] #count.index for count loop
}

variable "zone_id" {
    default = "Z04803303VFTPZATMTQ6X"
}

variable "domain_name" {
    default = "devopsaws.store"
}

variable "common_tags" {
    default = {
        Project = "Test"
        Terraform = "True"
    }
}
