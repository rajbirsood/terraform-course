provider "aws" {
  access_key = "AKIAID2J5D573W5RBNTA"
  secret_key = "eFWmhNL6wyg1WqYQYi38R4DF5HAlxyR+4tXEzkBa"
  region     = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-43d0982c"
  instance_type = "t2.micro"
}
