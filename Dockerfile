MAINTAINER matteoredaelli
# archlinux
#FROM yyolk/rpi-archlinuxarm
#ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk
#RUN  pacman -Syu --noconfirm
#RUN  pacman -S --noconfirm  extra/jdk8-openjdk

#raspian
FROM resin/rpi-raspbian
ENV JAVA_HOME /usr/lib/jvm/java-1.7.0-openjdk-armhf

# install required packages
RUN apt-get update
RUN apt-get -y dist-upgrade
RUN apt-get install -y --no-install-suggests curl openjdk-7-jdk

RUN  curl -s http://apache.openmirror.de/karaf/3.0.3/apache-karaf-3.0.3.tar.gz  | tar -xz -C /opt
RUN cd /opt && ln -s apache-karaf-3.0.3 apache-karaf
RUN mkdir /karaf-share
VOLUME ["/karaf-share"]
EXPOSE 1099 8101 44444
ENTRYPOINT ["/opt/apache-karaf/bin/karaf"]
