terraform {
  backend "s3" {
    bucket   = "terrafrom-test-to-delete-bucket"
    key      = "backend/vpc"
    region   = "ap-south-1"
    role_arn   = "arn:aws:iam::471112548391:role/decimal-jenkins-role"
  }
}
