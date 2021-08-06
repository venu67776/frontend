FROM node:alpine as build-deps
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm install
COPY . ./
RUN npm run build

# Nginx
FROM nginx:1.12-alpine
COPY --from=build-deps /usr/src/app/build /var/www/html/frontend
COPY        roboshop-docker.conf /etc/nginx/conf.d/default.conf
CMD ["nginx", "-g", "daemon off;"]