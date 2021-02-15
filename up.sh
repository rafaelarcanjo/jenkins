#!/bin/bash
docker run -d --rm --name jenkins -u root -p 8080:8080 -v jenkins-data:/var/jenkins_home \
    -v $(which docker):/usr/bin/docker -v /var/run/docker.sock:/var/run/docker.sock jenkinsci/blueocean