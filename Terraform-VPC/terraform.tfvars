vpc_cidr = "10.0.0.0/16"

subnet_cidr = [ "10.0.1.0/24","10.0.2.0/24" ]

cmd = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras enable nginx1
              sudo yum install -y nginx
              sudo systemctl start nginx
              sudo systemctl enable nginx
              AZ=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)
              echo "<h1>Welcome to Terraform Nginx Web Server by HariNemNem</h1>" | sudo tee /usr/share/nginx/html/index.html  
              echo "<p>Availability Zone: $AZ</p>" | sudo tee -a /usr/share/nginx/html/index.html

EOF

key_name = "aws"

