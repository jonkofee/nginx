FROM nginx:alpine

#Update
RUN apk update && apk upgrade

#Install custom dependencies
RUN apk --no-cache add bash

# Remove all old config
RUN rm -rf /etc/nginx/conf.d/*

# Replace main config
COPY nginx.conf /etc/nginx/nginx.conf

RUN mkdir /etc/nginx/conf.d.correct

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["sh", "/usr/local/bin/docker-entrypoint.sh"]
