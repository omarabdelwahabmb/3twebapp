variable "vpc_id" {
  description = "ID of the VPC to associate the subnet with"
  type        = string
}

variable "public_subnet1_id" {
  description = "The ID of the subnet"
  type        = string
}

variable "public_subnet2_id" {
  description = "The ID of the subnet"
  type        = string
}

variable "igw_id" {
  description = "ID of the igw"
  type        = string
}