# Etap 1: build JAR
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn -q -DskipTests dependency:go-offline
COPY src ./src
RUN mvn -q package -DskipTests

# Etap 2: uruchomienie
FROM eclipse-temurin:17-jre
WORKDIR /opt/app
COPY --from=build /app/target/devops-portfolio-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]

