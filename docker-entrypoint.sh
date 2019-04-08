#!/bin/bash

for file in /etc/nginx/conf.d/*; do
	filename=$(basename -- "${file}")
	envsubst "`printf '${%s} ' $(bash -c "compgen -A variable")`" < /etc/nginx/conf.d/${filename} > /etc/nginx/conf.d.correct/${filename}
done

exec nginx -g 'daemon off;'
