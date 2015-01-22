FROM shaomq/xiaomi_demo_base

### Compile ###
WORKDIR /code
ADD pom.xml /code/pom.xml
#RUN ["mvn", "dependency:resolve"]
#RUN ["mvn", "verify"]
ADD src /code/src
RUN ["mvn", "package"]

### install ###
RUN cp target/xiaomi_demo.war $CATALINA_HOME/webapps/

### run ###
EXPOSE 8080
CMD ["catalina.sh", "run"]

