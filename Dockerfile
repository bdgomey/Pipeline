FROM ubuntu:20.04


RUN cd /opt
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.56/bin/apache-tomcat-9.0.56.tar.gz
RUN tar -xzvf apache-tomcat-9.0.56.tar.gz
RUN mv apache-tomcat-9.0.56 tomcat
RUN rm /opt/tomcat/webapps/manager/META-INF/context.xml
RUN rm /opt/tomcat/conf/tomcat-users.xml
COPY tomcat-users.xml /opt/tomcat/conf/
COPY context.xml /opt/tomcat/webapps/manager/META-INF
COPY /var/lib/jenkins/workspace/Pipeline/webapp/target/webapp.war /opt/tomcat/webapps
RUN cd /home/ubuntu
RUN chmod +x /opt/tomcat/bin/tomcatup.sh
CMD ["./opt/tomcat/bin/tomcatup.sh"]
