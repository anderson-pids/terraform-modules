# resource "aws_security_group" "web" {
  
#   name = "Web-app"
#   description = "Allow public inboud traffic"
#   vpc_id = aws_vpc.this.id

#   ingress {
#     cidr_blocks = [ "0.0.0.0/0" ]
#     from_port = 80
#     protocol = "tcp"
#     to_port = 80
#   } 

#   ingress {
#     cidr_blocks = [ "0.0.0.0/0" ]
#     from_port = 443
#     protocol = "tcp"
#     to_port = 443
#   } 

#   ingress {
#     cidr_blocks = [ "0.0.0.0/0" ]
#     from_port = -1
#     protocol = "icmp"
#     to_port = -1
#   } 

#   egress {
   
#     from_port = 3306
#     to_port = 3306
#     protocol = "tcp"
#     cidr_blocks = [ aws_subnet.this["private_a"].cidr_block ]
#   } 

#   tags = merge(local.major_tags, { Name = "Web Server"})
# }

# resource "aws_security_group" "db" {
  
#   name = "DB"
#   description = "Allow public inboud traffic"
#   vpc_id = aws_vpc.this.id

#   ingress {
#     from_port = 3306
#     to_port = 3306
#     protocol = "tcp"
#     security_groups = [aws_security_group.web.id]

#   } 

#   ingress {
#     cidr_blocks = [aws_vpc.this.cidr_block]
#     from_port = 22
#     protocol = "tcp"
#     to_port = 22
#   } 

#   ingress {
#     cidr_blocks = [aws_vpc.this.cidr_block]
#     from_port = -1
#     protocol = "icmp"
#     to_port = -1
#   } 

#   egress {
   
#     from_port = 3306
#     to_port = 3306
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   } 

#   tags = merge(local.major_tags, { Name = "Data Base Server"})
# }

# resource "aws_security_group" "alb" {
#   name = "aws-lb-sg"
#   description = "Load Balancer sg"
#   vpc_id = aws_vpc.this.id
# }