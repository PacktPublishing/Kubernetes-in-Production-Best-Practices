resource "aws_vpc" "eks_vpc" {
  cidr_block           = var.eks_vpc_block
  enable_dns_hostnames = true
  tags = merge(
    var.common_tags,
    {
      Name = "${var.clusters_name_prefix}-vpc"
    },
  )
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

data "aws_availability_zones" "availability_zones" {
}

resource "aws_subnet" "eks_private_subnets" {
  count             = length(var.eks_private_subnets_prefix_list)
  cidr_block        = element(var.eks_private_subnets_prefix_list, count.index)
  vpc_id            = aws_vpc.eks_vpc.id
  availability_zone = data.aws_availability_zones.availability_zones.names[count.index]
  tags = merge(
    var.common_tags,
    {
      Name = "eks-private-${var.clusters_name_prefix}-${data.aws_availability_zones.availability_zones.names[count.index]}"
    },
  )
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "aws_route_table" "eks_private_route_tables" {
  count  = length(var.eks_private_subnets_prefix_list)
  vpc_id = aws_vpc.eks_vpc.id
}

resource "aws_route" "eks_private_routes" {
  count                  = length(var.eks_private_subnets_prefix_list)
  route_table_id         = element(aws_route_table.eks_private_route_tables.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = element(aws_nat_gateway.eks_nat_gws.*.id, count.index)
  timeouts {
    create = "5m"
  }
}

resource "aws_route_table_association" "eks_private_rt_association" {
  count          = length(var.eks_private_subnets_prefix_list)
  route_table_id = element(aws_route_table.eks_private_route_tables.*.id, count.index)
  subnet_id      = element(aws_subnet.eks_private_subnets.*.id, count.index)
}

resource "aws_subnet" "eks_public_subnets" {
  count             = length(var.eks_public_subnets_prefix_list)
  cidr_block        = element(var.eks_public_subnets_prefix_list, count.index)
  vpc_id            = aws_vpc.eks_vpc.id
  availability_zone = data.aws_availability_zones.availability_zones.names[count.index]

  tags = merge(
    var.common_tags,
    {
      "Name" = "eks-public-${var.clusters_name_prefix}-${data.aws_availability_zones.availability_zones.names[count.index]}"
    },
  )

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "aws_route_table" "eks_public_route_table" {
  vpc_id = aws_vpc.eks_vpc.id
}

resource "aws_route" "eks_public_route" {
  route_table_id         = aws_route_table.eks_public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.eks_igw.id
  timeouts {
    create = "5m"
  }
}

resource "aws_route_table_association" "eks_public_rt_association" {
  count          = length(var.eks_public_subnets_prefix_list)
  route_table_id = aws_route_table.eks_public_route_table.id
  subnet_id      = element(aws_subnet.eks_public_subnets.*.id, count.index)
}

resource "aws_internet_gateway" "eks_igw" {
  vpc_id = aws_vpc.eks_vpc.id
}

resource "aws_nat_gateway" "eks_nat_gws" {
  count         = length(var.eks_public_subnets_prefix_list)
  allocation_id = element(aws_eip.eks_nat_ips.*.id, count.index)
  subnet_id     = element(aws_subnet.eks_public_subnets.*.id, count.index)
}

resource "aws_eip" "eks_nat_ips" {
  count = length(var.eks_public_subnets_prefix_list)
  vpc   = true
}
