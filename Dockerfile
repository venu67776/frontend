FROM node:10-alpine as builder
WORKDIR /frontend
COPY package*.json ./
RUN npm install
RUN npm run build
COPY . /frontend


FROM nginx:alpine as production-build
COPY --from=builder /frontend/dist /var/www/html/frontend
COPY --from=builder /frontned/todo-docker.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]