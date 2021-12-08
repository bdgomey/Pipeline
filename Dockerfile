FROM openjdk:11-slim-buster as build
RUN apt update
RUN apt install wget -y
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.56/bin/apache-tomcat-9.0.56.tar.gz
RUN tar -xzvf apache-tomcat-9.0.56.tar.gz
RUN mv apache-tomcat-9.0.56 tomcat
RUN rm tomcat/webapps/manager/META-INF/context.xml
RUN rm tomcat/conf/tomcat-users.xml
COPY tomcat-users.xml tomcat/conf/
COPY context.xml tomcat/webapps/manager/META-INF
COPY webapp.war /tomcat/webapps
RUN chmod +x tomcat/bin/startup.sh
CMD ["./tomcat/bin/startup.sh"]
