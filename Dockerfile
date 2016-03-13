###
# Mainflux Freeboard Dockerfile
###
# Set the base image to Node, onbuild variant: https://registry.hub.docker.com/_/node/

FROM node:4.2.3
MAINTAINER Mainflux

RUN apt-get update -qq && apt-get install -y build-essential

RUN mkdir /src

###
# Installations
###
# Add Grunt globally

RUN npm install -g grunt-cli
RUN npm install -g nodemon
RUN npm install -g http-server

# Finally, install all project Node modules
WORKDIR /src
ADD package.json /src/package.json
RUN npm install

# Bundle app source
COPY . /src


RUN pwd
RUN ls
RUN grunt

EXPOSE 8080

###
# Run main command from entrypoint and parameters in CMD[]
###

CMD [""]

# Set default container command
ENTRYPOINT http-server .
