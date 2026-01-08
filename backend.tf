terraform {
  backend "s3" {

    bucket = "mybucket162977"
    key= "tools/state"
    region = "us-east-1"

  }
}