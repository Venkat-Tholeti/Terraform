variable "project" {
    default = "Testing"
}

variable "environment" {
    default = "dev"
}

variable "component" {
    default = "Test"
}

variable "common_tags" {
    default = {
        Project = "Test"
        Terraform = "True"
    }
}