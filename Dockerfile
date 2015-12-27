FROM nginx:1.9.9

MAINTAINER Homely

COPY nginx.conf /etc/nginx/nginx.conf
COPY /www /usr/share/nginx/html

EXPOSE 80 443


