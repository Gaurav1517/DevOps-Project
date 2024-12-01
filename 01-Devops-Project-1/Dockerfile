# FROM openjdk:8
# EXPOSE 8080
# ADD target/devops-integration.jar devops-integration.jar
# ENTRYPOINT ["java","-jar","/devops-integration.jar"]


FROM openjdk
WORKDIR /app 
COPY ./target/*.jar  /app.jar 
CMD ["java","-jar","app.jar"]

