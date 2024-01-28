FROM maven:3.9.0-eclipse-temurin-17-alpine
COPY . \app
EXPOSE 8080:8080
WORKDIR \app
RUN mvn clean install
ENTRYPOINT ["java", "-jar", "./target/spring-boot-3-hello-world-1.0.0-SNAPSHOT.jar"]
