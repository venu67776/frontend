FROM        nginx 
RUN         apt update &&apt install npm -y
RUN         mkdir -p /var/www/html/frontend
COPY        . /var/www/html/frontend
RUN         npm install --unsafe-perm sass sass-loader node-sass wepy-compiler-sass
RUN         npm run build
COPY        todo-docker.conf /etc/nginx/conf.d/default.conf
COPY        nginx.conf  /etc/nginx/nginx.conf
CMD         ["nginx", "-g", "daemon off;"] 