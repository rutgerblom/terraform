provider "aws"{
    region = "us-east-2"
}

resource "aws_instance" "example" {
    ami             = "ami-06d5a8ce809b866ee"
    instance_type   = "t2.micro"
}