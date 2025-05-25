FROM maven:3-openjdk-17
COPY . .
ENTRYPOINT ["mvn", "tomcat7:run"]
#CMD ["java", "-jar", "lookfreelanzers.jar"]
#CMD mvn tomcat7:run  - this command will start shell as an extra process as this is shell format

#buid image with command:  docker build -t lookfreelanzers .
#run image with command: docker run -p 8080:8080 lookfreelanzers