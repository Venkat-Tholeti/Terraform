# variables
# ============
# variables file
# terraform.tfvars --> same filename for terraform to consider
# command line
# env variables TF_VAR_<variable-name>

#PREFERENCE IN SEQUENCE 
# 1. command line # terraform plan -var "sg_name=cmd-test"
# 2. tfvars # FROM terraform.tfvars
# 3. env variables # USING EXPORT TF_VAR_<variable-name> TO SET THE VARIABLE & UNSET TO REMOVE THE ENV VARIABLE
# 4. default values # FROM VARIABLE FILE
# 5. user prompt



variable "ami_id" {
  description = "AMI ID OF JOINDEVOPS"
  type        = string
  default     = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  description = "DEFAULT INSTANCE TYPE"
  type        = string
  default     = "t2.micro"
}

variable "ec2_tags" {
  type = map(string) # map of string or map
  default = {
    Name    = "PRACTICE"
    Purpose = "PROJECT"
  }
}

variable "sg_name" {
  default = "DEVOPS PRACTICE"
}

variable "sg_description" {
  default = "ALLOW ALL PORTS"
}

variable "from_port" {
  type    = number
  default = 0
}

variable "to_port" {
  type    = number
  default = 0
}

variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "sg_tags" {
  default = {
    Name = "Terraform Test"
  }
}

variable "ports" {
  default = [22, 80, 443]
}
