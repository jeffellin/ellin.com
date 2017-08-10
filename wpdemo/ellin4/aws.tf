provider "aws" {
    region = "us-east-1"
    profile = "ellin2"
}

data "aws_caller_identity" "current" {}

data "aws_availability_zones" "available" {}
