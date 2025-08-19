# Use a Java 17 base image
FROM eclipse-temurin:23-jdk-alpine

# Set working directory
WORKDIR /app

# Copy Maven wrapper and pom.xml
COPY mvnw pom.xml ./
COPY .mvn .mvn

# Download dependencies
RUN ./mvnw dependency:go-offline

# Copy the rest of the source code
COPY src ./src

# Package the application
RUN ./mvnw clean package -DskipTests

# Run the jar
CMD ["java", "-jar", "target/backend-service.jar"]
