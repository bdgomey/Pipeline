FROM ubuntu:20.04


RUN cd /opt
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.56/bin/apache-tomcat-9.0.56.tar.gz
RUN tar -xzvf apache-tomcat-9.0.56.tar.gz
RUN mv apache-tomcat-9.0.56 tomcat


COPY /var/lib/jenkins/workspace/Pipeline/webapp/target/webapp.war /opt/tomcat/webapps
RUN cd /home/ubuntu

CMD ["./tomcatup.sh"]
