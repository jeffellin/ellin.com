
resource "aws_vpc" "ellin-vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    tags {
        Name = "ellin-vpc"
    }
}

##Subnets
##Use both private and public so we can 
##support multiAZ RDS
resource "aws_subnet" "public-a" {
    vpc_id                  = "${aws_vpc.ellin-vpc.id}"
    cidr_block              = "10.0.1.0/24"
    availability_zone = "${data.aws_availability_zones.available.names[0]}"
   
}


#Route and Internet Gateway for inbound connections to 
#public subnet
#########################################

resource "aws_route_table" "nat_route_table" {
    vpc_id = "${aws_vpc.ellin-vpc.id}"
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${aws_internet_gateway.gw.id}"
    }
    
}

resource "aws_internet_gateway" "gw" {
    vpc_id = "${aws_vpc.ellin-vpc.id}"
    tags {
        Name = "qubole_internet_gateway"
    }
}

# route table associations
# public route tables
resource "aws_route_table_association" "ellin-public" {
    subnet_id = "${aws_subnet.public-a.id}"
    route_table_id = "${aws_route_table.nat_route_table.id}"
}
