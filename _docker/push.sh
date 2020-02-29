#!/bin/bash

# Note: Keep in sync with push.cmd
# See push.cmd for comments

docker tag $dockerUsername/$dockerRepo:dev $dockerUsername/$dockerRepo:latest
docker push $dockerUsername/$dockerRepo:latest
