FROM nginx:alpine

# Remove all old config
RUN rm -rf /etc/nginx/conf.d/*
