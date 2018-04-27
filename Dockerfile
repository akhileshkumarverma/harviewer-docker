# Multi-stage build
# Build stage depends on Node.js and Apache ANT
FROM node:6-wheezy as builder

# Just add Apache ANT
RUN apt-get update -y && \
    apt-get install -y ant

# Copy the code
ADD . /build

# Setting the work stage
WORKDIR /build

# Get the Node.js dependencies and build the UI
RUN npm install && \
    ant build 

# Using the PHP Apache
FROM php:apache

MAINTAINER marcello.desales@gmail.com
LABEL github.com https://github.com/marcellodesales/harviewer-docker

# Get the source built and deploy on Apache
COPY --from=builder /build/webapp-build /var/www/html

# The port used by Apache
EXPOSE 80
