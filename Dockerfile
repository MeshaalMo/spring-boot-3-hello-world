FROM openjdk:17
RUN mvn clean install
ADD ./target/spring-boot-3-hello-world-1.0.0-SNAPSHOT.jar spring-boot-3-hello-world-1.0.0-SNAPSHOT.jar
EXPOSE 8080:8080
RUN java -jar /spring-boot-3-hello-world-1.0.0-SNAPSHO.jar
