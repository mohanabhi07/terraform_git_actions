# variable "region" {
#   description = "AWS region"
#   type        = string
#   default     = "us-east-1"
# }

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24","10.0.3.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24","10.0.6.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones to use"
  type        = list(string)
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "myproject"
}
