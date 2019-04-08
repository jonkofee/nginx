![nginx latest](https://img.shields.io/badge/nginx-latest-brightgreen.svg)
[![](https://img.shields.io/docker/stars/jonkofee/nginx.svg)](https://hub.docker.com/r/jonkofee/nginx 'DockerHub')
[![](https://img.shields.io/docker/pulls/jonkofee/nginx.svg)](https://hub.docker.com/r/jwilder/jonkofee/nginx 'DockerHub')

Wrapp for [nginx official image](https://hub.docker.com/_/nginx "Alpine")

## Features
* Default server responses `444` code
* Using environment variables in the config file
* Enabled `GZIP`
* Default charset `UTF-8`
* Off server tokens (nginx version in response header)
* Keepalive timeout `30 sec`
* Enabled `sendfile`


## Exampe use `ENV` var in config file
### docker-compose.yml
```yaml
version: '3'
services:
  web:
  image: jonkofee/nginx
  working_dir: /code
  ports:
    - ${NGINX_SERVER_PORT}:80
  volumes:
    - ./:/code
    - ./docker/nginx/conf:/etc/nginx/conf.d
  environment:
    - DOMAIN=test.local
    - PORT=80 
```
### host.conf
```Nginx
server {
  server_name api.${DOMAIN};
  listen ${POST}

  location / {
    root /code;

    fastcgi_split_path_info ^(.+\.php)(/.+)$;
    fastcgi_pass php:9000;
    include fastcgi_params;
    fastcgi_param SCRIPT_FILENAME $document_root/index.php;
    fastcgi_param PATH_INFO $fastcgi_path_info;
  }
}
```
