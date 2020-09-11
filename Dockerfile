FROM alpine:3

RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    s3cmd
RUN apk add --no-cache \
    postgresql-client

WORKDIR /usr/app

COPY ./backup.sh ./backup.sh
RUN chmod +x ./backup.sh

ENV S3_ACCESS_KEY= \
    S3_SECRET_KEY= \
    S3_ENDPOINT= \
    S3_HOST_BUCKET= \
    S3_REGION= \
    S3_DESTINATION= \
    PG_HOST= \
    PG_PORT= \
    PG_DATABASE= \
    PG_USER= \
    PG_PASSWORD=

ENTRYPOINT ./backup.sh
