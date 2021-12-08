FROM ubuntu:latest
RUN apt update
RUN apt install wget -y
RUN cd /opt
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.56/bin/apache-tomcat-9.0.56.tar.gz
RUN tar -xzvf apache-tomcat-9.0.56.tar.gz
RUN mv apache-tomcat-9.0.56 tomcat

