# Docker Django

A proposal of simple Docker stack with Nginx and Gunicorn for production server. Base image have *314 MB*.
This is a #WIP project. Any thoughts will be welcome.

## First of all

First of all, edit *ops/project.vars* and update project name and project name image.

### ops/project.vars

    PROJECT_NAME := pr-myproject
    PROJECT_NAME_IMG := pr-img-myproject:latest
    PROJECT_LISTEN_ADDR := 8001:80 

The project\_listen\_addr is the "-p" docker param. If you want to publish only to localhost, put this variable to:

    PROJECT_LISTEN_ADDR := 127.0.0.1:8001:80 

Now You need to build the base docker image.

    make build-base

Base docker image contains a fresh fedora 24 install with supervisor, gunicorn, nginx and several libraries. This image contains entrypoint and nginx and supervisor stuff.

## Building project

1. Create a django project in */app* folder.
2. Pip freeze django requirements into */app/requirements.txt*;
2. Edit the project root *Dockerfile* and change the *PROJECT_MAIN_MODULE* to django's project name;
3. Build the image with docker build:

    make build-deploy

## Roadmap

1. Build a makefile task to attach nodejs container running _bower install_ on static folder.
2. Build a command to bootstrap a new django project configuring project vars and Dockerfile automatically.
3. Setup nginx to handle 40x and 50x effectively;
