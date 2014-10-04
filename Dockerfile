FROM sionsmith/tomcat-7

MAINTAINER Sion Smith sion.smith@gmail.com

RUN apt-get -qq update

#install maven and git to build project
RUN apt-get install -y wget git-core maven

# Pull project
RUN git clone https://github.com/sionsmith/spring-petclinic.git

# Build project
RUN cd spring-petclinic && mvn package
RUN mv /spring-petclinic/target/petclinic.war /opt/tomcat/webapps/petclinic.war
