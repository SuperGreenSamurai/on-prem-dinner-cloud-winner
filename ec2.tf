resource "aws_vpc" "hello-world-vpc" {
  cidr_block           = "10.1.0.0/16"
  enable_dns_support   = true # Enable DNS support
  enable_dns_hostnames = true # Enable DNS hostnames, set to output
  tags = {
    name = "hello-world-vpc"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id            = aws_vpc.hello-world-vpc.id
  cidr_block        = "10.1.0.0/24"
  availability_zone = "us-west-2a"

}

resource "aws_instance" "hello-world-ec2" {
  ami           = "ami-0ebf411a80b6b22cb" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet1.id
  key_name      = "a-random-key-name" # Replace with your key pair name. 
  #If you are migrating a small amount of front end app files for example, allow SSH in your security group, and send the files from the custom on-prem IP. 
  #The security group allows us SSH access to/from the on-premises network. 
  #we can just transfer files using that key pair, file path, and send it to the EC2 with the SCP command.

  tags = {
    Name = "hello-world-ec2"
  }

}
