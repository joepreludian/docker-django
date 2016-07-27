# Docker Django

A proposal of simple Docker stack with Nginx and Gunicorn for production server.
This is a #WIP project. Any thoughts will be welcome.

## First of all

First of all, edit *ops/project.vars* and update project name and project name image.

### ops/project.vars

    PROJECT_NAME := pr-myproject
    PROJECT_NAME_IMG := pr-img-myproject:latest

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
