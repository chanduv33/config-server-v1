FROM openjdk:8-jdk-alpine
RUN mkdir app
RUN chmod +x deploy.sh
COPY target/config-0.0.1-SNAPSHOT.jar config.jar
EXPOSE 8089
ENTRYPOINT ["java","-jar","config.jar"]