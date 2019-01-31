FROM ubuntu

MAINTAINER Gustavo Rozolin da Silva <gustavorozolin@gmail.com>

RUN apt-get update 

RUN apt-get install -y apache2

RUN a2enmod proxy

RUN a2enmod proxy_http

RUN a2enmod proxy_balancer

RUN a2enmod lbmethod_byrequests

RUN a2enmod headers

CMD /usr/sbin/apache2ctl -D FOREGROUND