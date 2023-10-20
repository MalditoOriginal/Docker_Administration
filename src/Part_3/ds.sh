#!/bin/bash

if [ "$1" == "go" ]; then
    # Build and run the Docker container
    docker build -t mini_server . && docker run -d -p 81:81 --name server mini_server
elif [ "$1" == "del" ]; then
    # Stop the container, remove it, and remove the image
    docker stop server && docker rm server
elif [ "$1" == "server" ]; then
    # Test the web server
    curl http://localhost:81
else echo "Unknown command: $1"
fi
