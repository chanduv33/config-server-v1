FROM openjdk:8-jdk-alpine
RUN mkdir app
COPY target/config-0.0.1-SNAPSHOT.jar /app/config.jar

ENTRYPOINT ["java","-jar","config.jar"]