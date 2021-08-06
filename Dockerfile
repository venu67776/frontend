FROM node:10 as build-deps
WORKDIR /app
COPY . /app
RUN npm install
COPY . ./
RUN npm run build

# Nginx
FROM nginx:1.12-alpine
COPY --from=build-deps /app/build /var/www/html/frontend
COPY        todo-docker.conf /etc/nginx/conf.d/default.conf
CMD ["nginx", "-g", "daemon off;"]