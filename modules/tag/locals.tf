
# locals {

#   subnet_ids = { for k, v in aws_subnet.this : v.tags.Name => v.id }

#   major_tags = {

#     Enviroment  = "Test"
#     Cost_center = "engenharia"
#     Sensitive   = true
#     Duration    = "temp"
#     Creation_by = "Terraform"

#   }

# }
