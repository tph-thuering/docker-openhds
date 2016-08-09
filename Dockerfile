FROM ubuntu:trusty

MAINTAINER <tobias.thuering@unibas.ch>

ENV hostname data-management.local

#ENV JAVA_HOME #java installation folder (optional)
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq \
  wget \
  openssh-server \
  openjdk-7-jre-headless \
  mysql-server \
  tomcat6 tomcat6-admin \
  libmysql-java \
 && apt-get -y clean 
# TODO: remove dpkg info folder after calling apt to use less disk-space (usually 110MB big)
# mysql-connector for tomcat
RUN ln -s /usr/share/java/mysql.jar /usr/share/tomcat6/lib/mysql.jar

# download Mirth Connect
RUN wget http://downloads.mirthcorp.com/connect/3.4.1.8057.b139/mirthconnect-3.4.1.8057.b139-unix.tar.gz
# download openhds
RUN wget https://github.com/SwissTPH/openhds-server/releases/download/openhds-1.5/openhds.war

ENV user data
ENV pw data

ENV workdir /opt/openhds/install
ADD setup.sh $workdir/
Add mysql/ $workdir/mysql/
ADD tomcat/ $workdir/tomcat/
ADD mirth/ $workdir/mirth/
ADD openhds/ $workdir/openhds/
# TODO: Remove this after prototype is stable and run docker with Environment variables ( -e var=value )
ADD .env $workdir/

# tomcat
EXPOSE 8080
# mirth connect server
EXPOSE 8082
# mirth Admin port
EXPOSE 8443

CMD /opt/openhds/install/setup.sh
