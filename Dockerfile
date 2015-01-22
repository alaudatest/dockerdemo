FROM shaomq/xiaomi_demo_base

### Compile ###
WORKDIR /code
ADD pom.xml /code/pom.xml
#RUN ["mvn", "dependency:resolve"]
#RUN ["mvn", "verify"]
ADD src /code/src
ADD server.xml /usr/local/tomcat6/conf/server.xml
RUN ["mvn", "package"]

### install ###
RUN cp target/xiaomi_demo.war $CATALINA_HOME/webapps/

### run ###
EXPOSE 80
CMD ["catalina.sh", "run"]

