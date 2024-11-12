variable "sg_id" {
    description = "SG ID for Applicaition Load Balancer"
    type = string
  
}
variable "subnets" {
    description = "Subnets for ALB"
    type = list(string)
  
}

variable "vpc_id" {
    description = "VPC ID for ALB"
    type = string
  
}

variable "intstances" {
    description = "Instance ID for target group attachment"
    type = list(string)

  
}