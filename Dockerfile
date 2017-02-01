FROM alpine:latest

LABEL maintainer Patrick Brunias <patrick@brunias.org>

RUN apk update && \
	apk add nginx bash


RUN mkdir /data /etc/nginx/sites-available /etc/nginx/sites-enabled /var/www/html

# COPY nginx/nginx.conf
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
# COPY nginx/conf.d/proxy.conf
COPY ./nginx/conf.d/proxy.conf /etc/nginx/conf.d/proxy.conf
# COPY /entrypoint.sh
COPY ./entrypoint.sh /usr/local/bin/

# CHMOD +x entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Ports
EXPOSE 80 443

# Boot up Nginx
CMD ["/usr/local/bin/entrypoint.sh"]
