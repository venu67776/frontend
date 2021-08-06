FROM node:10
RUN  apt update && apt install nginx -y
RUN  mkdir /var/www/html/frontend
WORKDIR /var/www/html/frontend
COPY . /frontend
RUN npm install
RUN npm run build
COPY todo-docker.conf /etc/nginx/conf.d/default.conf
CMD ["nginx", "-g", "daemon off;"]