provider "aws"{
    version = "~> 2.64"
    region = "us-east-2"
}

terraform {
    backend "remote" {
        hostname        = "app.terraform.io"
        organization    = "rutgerblom"

        workspaces {
            name = "terraform"
        }
    }
}