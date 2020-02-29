docker run -v %workspaceFolder%:/srv/jekyll -v %workspaceFolder%\_site:/srv/jekyll/_site %dockerUsername%/%dockerRepo%:latest "/srv/jekyll/_docker/run.sh"
