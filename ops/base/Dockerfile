FROM fedora:latest
MAINTAINER Jonhnatha Trigueiro <joepreludian@gmail.com>

RUN dnf install -y nginx supervisor python-gunicorn python-devel \
    python-pip libtiff-devel libjpeg-devel zlib-devel freetype-devel \
    lcms2-devel libwebp-devel tcl-devel tk-devel && dnf clean all && \
    pip install --upgrade pip supervisor supervisor-stdout

ADD nginx.conf /etc/nginx/nginx.conf
ADD supervisord.conf /etc/supervisord.conf
ADD entrypoint.sh /entrypoint.sh

