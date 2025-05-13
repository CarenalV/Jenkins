# Imagen base con OpenJDK 21
FROM openjdk:21-jdk-slim

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el archivo JAR de la aplicación al contenedor
COPY target/myapp.jar /app/myapp.jar

# Comando de entrada para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "/app/myapp.jar"]
