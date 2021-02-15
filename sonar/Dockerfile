FROM sonarqube:lts

USER root
RUN apt-get update && apt-get install nodejs -y && ln -s "$(which nodejs)" /usr/local/bin/node
