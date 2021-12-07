FROM openjdk:11-slim-buster as build

RUN apt-get update
RUN apt-get install -y maven
RUN apt install apache2 -y
RUN rm /var/www/html/index.html
COPY . /opt
WORKDIR /opt
COPY myproject/src/main/webapp/index.jsp /var/www/html/
RUN mvn clean package install
CMD ["systemctl","start","apache2"]
