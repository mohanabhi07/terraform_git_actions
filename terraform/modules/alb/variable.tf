variable "sg_id" {
    description = "sg id"
    type = string
  
}

variable "subnet_id" {
    description = "subnet ids"
    type = list(string)
  
}

variable "vpc_id" {
    description = "vpc ID"
    type = string
  
}

variable "ec2" {
    description = "ec2 instance ID"
    type = list(string)
  
}

variable "project_name" {
    description = "name of the project"
    type = string
  
}