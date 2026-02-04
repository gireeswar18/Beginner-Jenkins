# -------- BUILD STAGE --------
FROM eclipse-temurin:25-jdk AS builder

WORKDIR /app

COPY pom.xml .
COPY mvnw .
COPY .mvn .mvn

RUN ./mvnw dependency:go-offline

COPY src src

RUN ./mvnw clean package -DskipTests


# -------- RUN STAGE --------
FROM eclipse-temurin:25-jre

WORKDIR /app

COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8081
ENTRYPOINT ["java","-jar","app.jar"]
