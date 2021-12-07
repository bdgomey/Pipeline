FROM openjdk:11-slim-buster as build

RUN apt-get update
RUN apt-get install -y maven
RUN apt install apache2
RUN rm /var/www/html/index.html
COPY . /opt
WORKDIR /opt
COPY src/main/webapp/index.jsp /var/www/html/
RUN mvn package
CMD ["systemctl","start","apache2"]
