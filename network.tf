### main vpc ###

resource "aws_vpc" "century-hike-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "century-hike-vpc"
  }
}

### main public subnet ###

resource "aws_subnet" "public-subnet-us-west-1a" {
  vpc_id                  = "${aws_vpc.century-hike-vpc.id}"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-west-1a"
  tags = {
  	Name =  "public subnet us-west-1a"
  }
}

### main private subnet ###

resource "aws_subnet" "private-subnet-us-west-1a" {
  vpc_id                  = "${aws_vpc.century-hike-vpc.id}"
  cidr_block              = "10.0.2.0/24"
  availability_zone = "us-west-1a"
  tags = {
  	Name =  "private subnet us-west-1a"
  }
}

## main internet gateway ##

resource "aws_internet_gateway" "century-hike-gateway" {
  vpc_id = "${aws_vpc.century-hike-vpc.id}"
  tags {
        Name = "century-hike-gateway"
    }
}

### main route to internet ###
	
resource "aws_route" "century-hike-internet-access" {
  route_table_id         = "${aws_vpc.century-hike-vpc.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.century-hike-gateway.id}"
}

### NAT gateway EIP ###

resource "aws_eip" "century-hike-eip" {
  vpc      = true
  depends_on = ["aws_internet_gateway.century-hike-gateway"]
}

### NAT gateway ###

resource "aws_nat_gateway" "century-hike-nat" {
    allocation_id = "${aws_eip.century-hike-eip.id}"
    subnet_id = "${aws_subnet.public-subnet-us-west-1a.id}"
    depends_on = ["aws_internet_gateway.century-hike-gateway"]
}

### private to interent route table ###

resource "aws_route_table" "century-hike-private-to-internet-route-table" {
    vpc_id = "${aws_vpc.century-hike-vpc.id}"
 
    tags {
        Name = "private to internet route table"
    }
}
 
resource "aws_route" "century-hike-private-to-internet-route" {
	route_table_id  = "${aws_route_table.century-hike-private-to-internet-route-table.id}"
	destination_cidr_block = "0.0.0.0/0"
	nat_gateway_id = "${aws_nat_gateway.century-hike-nat.id}"
}

### route table associations ###

# associate public subnet us_west_1a to public route table
resource "aws_route_table_association" "public-subnet-us-west-1a-association" {
    subnet_id = "${aws_subnet.public-subnet-us-west-1a.id}"
    route_table_id = "${aws_vpc.century-hike-vpc.main_route_table_id}"
}
 
# associate private subnet us_west_1a to private route table
resource "aws_route_table_association" "private-subnet-us-west-1a-association" {
    subnet_id = "${aws_subnet.private-subnet-us-west-1a.id}"
    route_table_id = "${aws_route_table.century-hike-private-to-internet-route-table.id}"
}
