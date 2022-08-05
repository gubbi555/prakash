FROM tomcat:latest
LABEL maintainer="prakash"
ADD /var/lib/jenkins/workspace/new/target/simpleweb.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
