resource "aws_s3_bucket" "backup_bucket" {
  bucket = "my-backup-bucketgg"

  tags = {
    Name        = "BackupBucket"
    Environment = "Production"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "backup_lifecycle" {
  bucket = aws_s3_bucket.backup_bucket.bucket

  rule {
    id     = "DeleteOldBackups"
    status = "Enabled"

    filter {
      prefix = "backups/"
    }

    expiration {
      days = 30
    }
  }
}
