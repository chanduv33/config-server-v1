FROM openjdk:8-jdk-alpine
RUN mkdir app
COPY target/config-v1-0.0.1-SNAPSHOT.jar config-v1.jar
EXPOSE 8089
ENTRYPOINT ["java","-jar","config-v1.jar"]