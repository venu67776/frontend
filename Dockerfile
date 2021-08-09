FROM node:10 as build-stage
RUN mkdir -p /var/www/html/frontend
WORKDIR  /var/www/html/frontend
COPY . /var/www/html/frontend
RUN npm install
RUN npm run build

FROM nginx
COPY --from=build-stage /var/www/html/frontend/todo-docker.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]