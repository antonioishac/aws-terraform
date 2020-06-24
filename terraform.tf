terraform {
    backend "s3" {
        bucket = "case-ajjishac"
        key = "case-curso-aws"
        region = "us-east-1"
        profile = "terraform"
    }
}