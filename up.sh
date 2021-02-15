#!/bin/bash
docker run -d --rm --name jenkins -u root -p 8080:8080 -v /jenkins-data:/var/jenkins_home \
    -v $(which docker):/usr/bin/docker -v /var/run/docker.sock:/var/run/docker.sock jenkinsci/blueocean

# Instalando o Docker Compose na imagem do Jenkins
# Se der tempo, coloco em Dockerfile
docker exec -it jenkins sh -c 'curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose'
docker exec -it jenkins sh -c 'chmod +x /usr/local/bin/docker-compose'