#!/bin/bash

if [ "$1" == "go" ]; then
    # Build and run the Docker container
    docker run -d -p 80:81 -v "$(pwd)/nginx/:/etc/nginx" --name server fletamar/mini_server:server
elif [ "$1" == "compose" ]; then
    docker-compose build && docker-compose up -d
elif [ "$1" == "del_server" ]; then
    # Stop the container, remove it
    docker stop server && docker rm server
elif [ "$1" == "del_nginx" ]; then
    docker stop nginx_server && docker rm nginx_server
elif [ "$1" == "server" ]; then
    # Test the web server and status page
    curl http://localhost:80
elif [ "$1" == "status" ]; then
    curl http://localhost:80/status
elif [ "$1" == "restart" ]; then
    docker restart server
elif [ "$1" == "dockle" ]; then
    docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock goodwithtech/dockle:v0.3.1 fletamar/mini_server:server 
else
    echo "Unknown command: $1"
fi