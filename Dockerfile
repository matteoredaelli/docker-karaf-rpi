FROM yyolk/rpi-archlinuxarm
MAINTAINER matteoredaelli
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk
RUN  pacman -Syy
RUN  pacman -S --noconfirm  extra/jdk8-openjdk
RUN  curl -s http://apache.openmirror.de/karaf/3.0.3/apache-karaf-3.0.3.tar.gz  | tar -xz -C /opt
RUN cd /opt && ln -s apache-karaf-3.0.3 apache-karaf
RUN mkdir /karaf-share
VOLUME ["/karaf-share"]
EXPOSE 1099 8101 44444
ENTRYPOINT ["/opt/apache-karaf/bin/karaf"]
