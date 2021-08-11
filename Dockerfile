FROM node:10 as builder
WORKDIR /frontend
COPY  . /frontend
RUN npm install
RUN npm run build

FROM nginx:latest
COPY --from=builder /frontend/dist /var/www/html/frontend/dist
COPY --from=builder /frontend/todo-docker.conf /etc/nginx/conf.d/default.conf
CMD ["nginx", "-g", "daemon off;"]