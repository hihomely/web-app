FROM nginx:1.9.9

MAINTAINER Homely

# Install python (so we can use j2)
RUN apt-get update && \
    apt-get -y install python-dev python-setuptools
# Install j2cli
RUN easy_install j2cli

# Copy the nginx config template to the expected dir for the bash script below.
COPY nginx.conf.j2 /templates/

COPY /www /usr/share/nginx/html

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]

# Expose both ports. The entrypoint script sets the port nginx will listen on.
EXPOSE 80 443
