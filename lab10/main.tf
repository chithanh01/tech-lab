resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

tags = {
    Name = "${var.env}-${var.project}-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.vpc.id
  for_each = var.public_subnet_numbers
  availability_zone = each.key

  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4 , each.value)

  tags = {
    Name = "${var.env}-${var.project}-public-subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.vpc.id
  for_each = var.private_subnet_numbers
  availability_zone = each.key

  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4 , each.value)

  tags = {
    Name = "${var.env}-${var.project}-private-subnet"
  }
}

resource "aws_eip" "nat" {
  domain   = "vpc"

  tags = {
    Name = "${var.env}-${var.project}"
    VPC  = aws_vpc.vpc.id
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.env}-${var.project}"
  }
}

resource "aws_nat_gateway" "ngw"{
  allocation_id = aws_eip.nat.id
  subnet_id = aws_subnet.public[element(keys(aws_subnet.public), 0)].id
}

resource "aws_route_table" "publicRTB"{
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block           = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "${var.env}-${var.project}-${var.publicRTB}"
    }
}

resource "aws_route_table" "privateRTB"{
    vpc_id = aws_vpc.vpc.id
    
    route {
        cidr_block           = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.ngw.id
    }

    tags = {
        Name = "${var.env}-${var.project}-${var.privateRTB}"
    }
}

resource "aws_route_table_association" "publicSubnet" {
  for_each = aws_subnet.public
  subnet_id      = aws_subnet.public[each.key].id
  route_table_id = aws_route_table.publicRTB.id
}

resource "aws_route_table_association" "privateSubnet" {
  for_each = aws_subnet.private
  subnet_id      = aws_subnet.private[each.key].id
  route_table_id = aws_route_table.privateRTB.id
}