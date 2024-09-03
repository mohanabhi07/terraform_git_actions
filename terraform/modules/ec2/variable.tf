variable "sg_id" {
    description = "SG id"
    type = string
  
}

variable "subnet_id" {
    description = "public subnet id"
    type = list(string)
  
}
variable "availability_zones" {
    description = "passing availability zones"
    type = list(string)
  
}
variable "project_name" {
    description = "name of the ec2 instance"
    type = string
  
}