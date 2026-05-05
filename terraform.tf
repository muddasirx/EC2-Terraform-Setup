terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }

  backend "s3" {
    bucket       = "tf-bucket-1039"
    key          = "terraform.tfstate"
    region       = "eu-north-1"
    use_lockfile = true
  }
}
