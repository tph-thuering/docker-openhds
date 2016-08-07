FROM ubuntu:trusty

MAINTAINER <tobias.thuering@unibas.ch>

# Change this
ENV hostname data-management.local
ENV user data
ENV pw data
ENV OPENHDS_URL https://github.com/SwissTPH/openhds-server/releases/download/openhds-1.5/openhds.war 

#ENV JAVA_HOME #java installation folder (optional)
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq \
  wget \
  openssh-server \
  openjdk-7-jre-headless \
  mysql-server \
  tomcat6 tomcat6-admin \
  libmysql-java \
 && apt-get -y clean 
RUN ln -s /usr/share/java/mysql.jar /usr/share/tomcat6/lib/mysql.jar
RUN wget $OPENHDS_URL

ENV workdir /opt/openhds/install
ADD setup.sh $workdir/
Add mysql/ $workdir/mysql/
ADD tomcat/ $workdir/tomcat/
ADD openhds/ $workdir/openhds/
ADD .env $workdir/

EXPOSE 8080

CMD /opt/openhds/install/setup.sh
