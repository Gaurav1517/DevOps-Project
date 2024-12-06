# Use the official Tomcat image as the base image
FROM tomcat:latest

# Copy the WAR file with its original name into the Tomcat webapps directory
COPY webapp/target/webapp.war /usr/local/tomcat/webapps/

# Expose the default Tomcat port
EXPOSE 8080

# Start the Tomcat server
CMD ["catalina.sh", "run"]


# FROM tomcat:latest
# RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps
# COPY ./*.war /usr/local/tomcat/webapps

