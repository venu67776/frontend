FROM        node:10
RUN         apt update && apt install nginx -y
RUN         mkdir -p /var/www/html/frontend
COPY        . /var/www/html/frontend
RUN         npm install --unsafe-perm sass sass-loader node-sass wepy-compiler-sass
RUN         npm run build
COPY        todo-docker.conf /etc/nginx/conf.d/default.conf
CMD         ["nginx", "-g", "daemon off;"]
