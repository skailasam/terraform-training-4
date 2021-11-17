resource "aws_s3_bucket" "my_state_bucket" {
  bucket = "talent-academy-3550-tfstates"
  
  versioning {
      enabled = true
  }

  tags = {
    Name        = "talent-academy-tfstates"
    Environment = "test"
  }
}

resource "aws_dynamodb_table" "terraform_lock_tbl" {
    name = "terraform-lock"
    read_capacity = 1
    write_capacity = 1
    hash_key = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
}