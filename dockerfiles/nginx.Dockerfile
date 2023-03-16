FROM nginx:stable-alpine
RUN rm /etc/nginx/conf.d/default.conf
COPY docker-stacks/nginx/conf.d/ /etc/nginx/conf.d/