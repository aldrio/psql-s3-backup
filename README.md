# Postgres s3 backup

Perform a simple postgresql database backup to s3.

## Environment

### S3
- S3_ACCESS_KEY
- S3_SECRET_KEY
- S3_ENDPOINT
- S3_HOST_BUCKET
- S3_REGION
- S3_DESTINATION - e.g. s3://my-backups/backup.sql

### Postgres
- PG_HOST
- PG_POST
- PG_DATABASE
- PG_USERNAME
- PG_PASSWORD
