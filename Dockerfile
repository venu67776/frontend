FROM node:10 as builder
WORKDIR /frontend
COPY  . /frontend
RUN npm install
RUN npm run build

FROM nginx:alpine as production-build
COPY --from=builder /frontend/dist /var/www/html/frontend
COPY --from=builder /frontned/todo-docker.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]