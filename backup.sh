#!/bin/sh

set -e

echo "Running pg_dump on $PG_DATABASE"
PGPASSWORD=$PG_PASSWORD pg_dump \
  --format=custom \
  -h "$PG_HOST" \
  -p "$PG_PORT" \
  -U "$PG_USERNAME" \
  "$PG_DATABASE" > backup.sql

echo "Uploading to s3 $S3_DESTINATION"
s3cmd \
  --access_key="$S3_ACCESS_KEY" \
  --secret_key="$S3_SECRET_KEY" \
  --host="$S3_ENDPOINT" \
  --host-bucket="$S3_HOST_BUCKET" \
  --region="$S3_REGION" \
  put backup.sql "$S3_DESTINATION"

echo "Done!"
