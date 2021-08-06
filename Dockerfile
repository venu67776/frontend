FROM        node:latest as build-deps
WORKDIR     /app
COPY        . /app
RUN         npm install --unsafe-perm sass sass-loader node-sass wepy-compiler-sass
RUN         npm run build
# Nginx
FROM         nginx:1.12-alpine
COPY         --from=build-deps /usr/src/app/build /var/www/html/frontend
COPY         todo-docker.conf /etc/nginx/conf.d/default.conf
CMD          ["nginx", "-g", "daemon off;"]