
# terraform init -upgrade
terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.8.1"
    }
  }
}

provider "random" {
  # Configuration options
}


resource "random_integer" "name" {
  min = 1
  max = 10
}
