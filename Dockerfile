FROM tomcat:8.5.94-jdk17-temurin
COPY target/lookfreelanzers-4.0.war /usr/local/tomcat/webapps/lookfreelanzers.war

#from first commit
#FROM maven:3-openjdk-17
#COPY . .Add commentMore actions
#ENTRYPOINT ["mvn", "tomcat7:run"]

#CMD ["java", "-jar", "lookfreelanzers.jar"]
#CMD mvn tomcat7:run  - this command will start shell as an extra process as this is shell format

#make sure .war file is there in target folder
#buid image with command:  docker build -t lookfreelanzers .
#run image with command: docker run -p 8080:8080 lookfreelanzers