#!/bin/bash
set -e

IMAGE_NAME=livesync-serverpeer-test

docker build -t $IMAGE_NAME .
docker run -it --rm --env-file .env -p 3000:3000 $IMAGE_NAME