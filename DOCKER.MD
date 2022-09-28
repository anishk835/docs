# Docker commands
1. Docker run :
  
    docker run -d -p 8098:8095 -v /root/username/DockerData/mountData:/mountData --env-file /root/username/DockerData/env.file docker-repo:6555/nifi
2. Remove all untagged images :

    docker rmi $(docker images | grep "^<none>" | awk "{print $3}")
3. Remove all the non running container :

    docker rm $(docker ps -a -q)

# Docker best practice 
1. https://github.com/wsargent/docker-cheat-sheet#best-practices
2. https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes
