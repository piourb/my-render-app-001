# --------------------------
# 1. Etap: build aplikacji
# --------------------------
FROM maven:3.9.9-eclipse-temurin-21 AS build
WORKDIR /app

# skopiuj pliki konfiguracyjne
COPY pom.xml .
RUN mvn dependency:go-offline

# skopiuj źródła i zbuduj jar
COPY src ./src
RUN mvn clean package -DskipTests

# --------------------------
# 2. Etap: finalny obraz
# --------------------------
FROM eclipse-temurin:21-jre
WORKDIR /app

# skopiuj gotowy jar z etapu build
COPY --from=build /app/target/*.jar app.jar

# port aplikacji (zmień, jeśli nie 8080)
EXPOSE 50000

# uruchomienie
ENTRYPOINT ["java", "-jar", "app.jar"]
