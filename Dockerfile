FROM openjdk:11-slim-buster as build

RUN apt-get update
RUN apt-get install -y maven
COPY . /opt
WORKDIR /opt
RUN mvn package
CMD ["java","-cp","target/docker-service-1.0-SNAPSHOT.jar","org.ea.service.App"]