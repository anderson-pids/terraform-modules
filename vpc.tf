resource "aws_vpc" "this" {
  cidr_block = "192.168.0.0/16"
  tags       = merge(local.major_tags, { Name = "vpc-to-autoscalling" })
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags   = merge(local.major_tags, { Name = "igw-autoscalling" })
}

resource "aws_subnet" "this" {

  for_each = {
    "public_a" : ["192.168.1.0/24", "${var.aws_region}a", "public-a"]
    "public_b" : ["192.168.2.0/24", "${var.aws_region}a", "public-b"]
    "private_a" : ["192.168.3.0/24", "${var.aws_region}a", "private-a"]
    "private_b" : ["192.168.4.0/24", "${var.aws_region}a", "private-b"]
  }

  vpc_id = aws_vpc.this.id

  cidr_block = each.value[0]

  availability_zone = each.value[1]

  tags = merge(local.major_tags, { Name = each.value[2] })

}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.this.id
  }

  tags = merge(local.major_tags, {Name="route public"})
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  tags = merge(local.major_tags, {Name="route private"})
}

resource "aws_route_table_association" "this" {
  for_each = { for k, v in aws_subnet.this : v.tags.Name => v.id }

  subnet_id = each.value
  route_table_id = substr(each.key, 0, 3) == "pub"  ? aws_route_table.public.id : aws_route_table.private.id
}
