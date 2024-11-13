output "instances" {
    value = aws_instance.web.*.id
  
}

output "web_instance_security_groups" {
  value = aws_instance.web[*].vpc_security_group_ids
}

