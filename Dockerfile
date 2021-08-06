FROM        nginx as
RUN         apt update &&apt install npm -y
RUN         mkdir -p /var/www/html/frontend
COPY        . /var/www/html/frontend
 