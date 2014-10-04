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

# Add jolokia for exposing JMX over http: (http://localhost:8080/jolokia/version)

RUN wget -q http://labs.consol.de/maven/repository/org/jolokia/jolokia-war/1.2.2/jolokia-war-1.2.2.war -O /opt/tomcat/webapps/jolokia.war
