REM Note: Requires %workspaceFolder% environment set to website's root folder
REM       as per VSCode

docker build -t %dockerUsername%/%dockerRepo%:dev -f %workspaceFolder%/_docker/Dockerfile %workspaceFolder%
