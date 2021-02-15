FROM sonarqube:7.7-community

USER root

RUN apt-get update \
    && apt-get install nodejs -y \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s /usr/bin/nodejs /usr/bin/node

USER sonarqube