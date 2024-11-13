output "ec2_security_groups" {
  value = module.ec2.web_instance_security_groups
  #value = aws_instance.web[*].vpc_security_group_ids
}