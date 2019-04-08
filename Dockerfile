FROM nginx:alpine

# Remove all old config
RUN rm -rf /etc/nginx/conf.d/*

# Replace main config
COPY nginx.conf /etc/nginx/nginx.conf
