FROM fedora:latest

# Install node/npm
RUN yum install -y sudo
RUN curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -
RUN yum install -y nodejs

# Install tedious, the driver for SQL Server for Node.js
RUN npm install tedious

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Bundle app source
COPY . /usr/src/app

EXPOSE 8080

CMD /bin/bash ./entrypoint.sh
