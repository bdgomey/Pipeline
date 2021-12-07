FROM openjdk:11-slim-buster as build

RUN apt-get update
RUN apt-get install -y maven
RUN apt install apache2 -y
RUN rm /var/www/html/index.html
COPY . /opt
WORKDIR /opt
RUN mvn clean package install
COPY myproject/src/main/webapp/index.jsp /var/www/html/
CMD ["systemctl","start","apache2"]
