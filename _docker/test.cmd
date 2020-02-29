REM Note: Requires %workspaceFolder% environment set to website's root folder
REM       as per VSCode

docker run -v %workspaceFolder%:/srv/jekyll -v %workspaceFolder%\_site:/srv/jekyll/_site %dockerUsername%/%dockerRepo%:dev "/srv/jekyll/_docker/run.sh"
