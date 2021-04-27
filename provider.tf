provider "aws" {
 region = "us-east-1"
}

terraform {
  backend "s3" {
      bucket = "trainingepsilonbatch4"
      key = "mandeep/tfstate"
      region = "us-east-1"
  }
}