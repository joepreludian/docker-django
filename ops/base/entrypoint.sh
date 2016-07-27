#!/bin/sh

if [ ! -e /firstrun ]
then
    echo "First run setup...";

    sed -e s/%%project_name%%/$PROJECT_MAIN_MODULE/g /etc/supervisord.conf > /etc/supervisord.conf.tmp && mv -f /etc/supervisord.conf.tmp /etc/supervisord.conf
    touch /firstrun;
fi

/usr/bin/supervisord -c /etc/supervisord.conf -n
