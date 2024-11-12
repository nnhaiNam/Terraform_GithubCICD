resource "aws_instance" "web" {
  count=length(var.ec2_names)
  ami           = data.aws_ami.amazon-2.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [var.sg_id]
  associate_public_ip_address = true
  subnet_id = var.subnets[count.index]
  user_data =  var.user_data
  availability_zone = data.aws_availability_zones.available.names[count.index]
  key_name = var.key_name

  tags = {
    Name = var.ec2_names[count.index]
  }
}