FROM openjdk:11-slim-buster as build

# Update the repository sources list
RUN apt-get update

# Install and run apache
RUN apt-get install -y apache2 && apt-get clean
RUN apt-get install -y maven
RUN rm /var/www/html/index.html
#ENTRYPOINT ["/usr/sbin/apache2", "-k", "start"]
COPY . /opt
WORKDIR /opt
RUN mvn clean package install
COPY src/main/webapp/index.jsp /var/www/html/

EXPOSE 80
CMD [“/usr/sbin/apache2”, “-D”, “FOREGROUND”]