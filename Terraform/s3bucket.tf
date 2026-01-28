resource "aws_vpc" "testresource" {
    cidr_block = "10.0.0.0/16"

tags = {
        Name = "test-vpc"
    }
}

resource "aws_subnet" "publicsubnet" {

    vpc_id= aws_vpc.testresource.id
    cidr_block=  "10.0.1.0/24"

}

resource "aws_subnet" "privatesubnet" {

    vpc_id= aws_vpc.testresource.id
    cidr_block=  "10.0.2.0/24"
    
}

resource "aws_internet_gateway" "igw" {
    vpc_id= aws_vpc.testresource.id
}

resource "aws_route_table" "routetable" {

    vpc_id= aws_vpc.testresource.id
    route{
        gateway_id=aws_internet_gateway.igw.id
        cidr_block= "0.0.0.0/0"
    }
}

resource "aws_route_table_association" "public-rt" {

    subnet_id= aws_subnet.publicsubnet.id
    route_table_id=aws_route_table.routetable.id
}
