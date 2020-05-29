resource "aws_s3_bucket" "terraform_state" {
    bucket = "terraform-state" 

    # Prevent accidental deletion of this bucket
    lifecycle {
        prevent_destroy = true
    }

    # Enable versioning
    versioning {
        enabled = true
    }

    # Enable encryption
    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }

    }
  
}

resource "aws_dynanodb_table" "terraform_locks" {
    name = "terraform-locks"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
}