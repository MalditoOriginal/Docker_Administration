## Part 1. Ready-made docker

As the final goal of your little practice you have immediately chosen to write a docker image for your own web server, so first you need to deal with a ready-made docker image for the server.
You chose a pretty simple **nginx**.

**== Task ==**

## Take the official docker image from **nginx** and download it using `docker pull`.

![docker](/src/Part_1/images/docker_0.png "docker pull nginx")


## Check for the docker image with `docker images`

![docker](/src/Part_1/images/docker_1.png "docker images")


## Run docker image with `docker run -d [image_id|repository]`

![docker](/src/Part_1/images/docker_3.png)


## Check that the image is running with `docker ps`

![docker](/src/Part_1/images/docker_4.png)


## View container information with `docker inspect [container_id|container_name]`

![docker](/src/Part_1/images/docker_5.png)

![docker](/src/Part_1/images/docker_6.png)

## From the command output define and write in the report the container size, list of mapped ports and container ip

"Size": "186639942"

"ExposedPorts": "80/tcp"

"IPAddress": "172.17.0.2"

## Stop docker image with `docker stop [container_id|container_name]`

![docker](/src/Part_1/images/docker_7.png)


## Check that the image has stopped with `docker ps`

![docker](/src/Part_1/images/docker_8.png)


## Run docker with ports 80 and 443 in container, mapped to the same ports on the local machine, with *run* command

`docker run -d -p 80:80 -p 443:443 nginx`

![docker](/src/Part_1/images/docker_9.png)


## Check that the **nginx** start page is available in the browser at *localhost:80*

`curl -I http://localhost:80`

![docker](/src/Part_1/images/docker_10.png)

![docker](/src/Part_1/images/docker_12.png)


## Restart docker container with `docker restart [container_id|container_name]`

`docker restart ba0cc52a551b`

![docker](/src/Part_1/images/docker_11.png)


## Check in any way that the container is running

`docker ps`

![docker](/src/Part_1/images/docker_13.png)


- Add the following screenshots to the report:
    - the call and output of all commands used in this part of the task;
    - **nginx** start page at *localhost:80* (address must be shown).
    
*Note:* **Don't upload heavy files (>10 mb) to git.**


# Part 2. Operations with container

Docker image and container are ready. Now we can look into **nginx** configuration and display page status.

**== Task ==**

## Read the *nginx.conf* configuration file inside the docker container with the *exec* command. 

`docker exec ba0cc52a551b cat /etc/nginx/nginx.conf`

![docker](/src/Part_2/images/docker_0.png)


## Create a *nginx.conf* file on a local machine

`docker exec ba0cc52a551b cat /etc/nginx/nginx.conf > nginx.conf`

![docker](/src/Part_2/images/docker_1.png)


## Configure it on the */status* path to return the **nginx** server status page

![docker](/src/Part_2/images/docker_2.png)


## Copy the created *nginx.conf* file inside the docker image using the `docker cp` command

`docker cp /Users/fletamar/DO5_SimpleDocker-1/src/Part_2/nginx.conf  ba0cc52a551b:/etc/nginx/nginx.conf`

![docker](/src/Part_2/images/docker_3.png)


## Restart **nginx** inside the docker image with *exec*

![docker](/src/Part_2/images/docker_4.png)


## Check that *localhost:80/status* returns the **nginx** server status page

`curl -I http://localhost:80/status`

![docker](/src/Part_2/images/docker_5.png)

![docker](/src/Part_2/images/docker_6.png)

## Export the container to a *container.tar* file with the *export* command

`docker export ba0cc52a551b > container.tar`

![docker](/src/Part_2/images/docker_8.png)

## Stop the container

`docker stop ba0cc52a551b`

![docker](/src/Part_2/images/docker_7.png)

## Delete the image with `docker rmi [image_id|repository]`without removing the container first

`docker rmi -f c20060033e06`

![docker](/src/Part_2/images/docker_10.png)

## Delete stopped container

`docker rm -f ba0cc52a551b`

![docker](/src/Part_2/images/docker_9.png)


## Import the container back using the *import* command

`cat container.tar | docker import - nginx`

![docker](/src/Part_2/images/docker_11.png)


## Run the imported container

`docker run -d -p 80:80 nginx nginx -g 'daemon off'`

![docker](/src/Part_2/images/docker_12.png)


## Check that *localhost:80/status* returns the **nginx** server status page

`curl -I http://localhost:80/status`

![docker](/src/Part_2/images/docker_13.png)

![docker](/src/Part_2/images/docker_14.png)


- Add the following screenshots to the report:
    - the call and output of all commands used in this part of the task;
    - the contents of the created *nginx.conf* file;
    - the **nginx** server status page at *localhost:80/status*.

