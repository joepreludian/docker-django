FROM joepreludian/django-supervisor-nginx:latest
MAINTAINER Jonhnatha Trigueiro <joepreludian@gmail.com>

ENV PROJECT_MAIN_MODULE 'neoratts'

RUN mkdir /app
ADD . /app

WORKDIR /app

RUN pip install -r requirements.txt && \
    python manage.py collectstatic --no-input

VOLUME ['/app']

EXPOSE 80

CMD /entrypoint.sh
