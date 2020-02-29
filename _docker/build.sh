#!/bin/bash

# Note: Keep in sync with build.cmd
# See build.cmd for comments

docker build -t $dockerUsername/$dockerRepo:dev -f $workspaceFolder/_docker/Dockerfile $workspaceFolder
