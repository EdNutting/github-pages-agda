#!/bin/bash

# Note: Keep in sync with test.cmd
# See test.cmd for comments

docker run -v $workspaceFolder:/srv/jekyll -v $workspaceFolder/_site:/srv/jekyll/_site $dockerUsername/$dockerRepo:dev "/srv/jekyll/_docker/run.sh"
