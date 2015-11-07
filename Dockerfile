# archlinux
FROM resin/raspberrypi2-debian:latest
# Enable systemd
ENV INITSYSTEM on

MAINTAINER matteoredaelli

RUN echo "APT::Get::Install-Recommends \"false\";" >> /etc/apt/apt.conf.d/99local; \
    echo "APT::Get::Install-Sugegsts \"false\";" >> /etc/apt/apt.conf.d/99local;

RUN apt-get update \
    && apt-get -y --force-yes --no-install-suggests install openjdk-7-jdk \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -c 'r user' -m -d /home/r -s /bin/bash r
USER r
ENV HOME /home/r
ENV JAVA_HOME /usr/lib/jvm/java-1.7.0-openjdk-armhf
ENV KARAF_VERSION=4.0.2

RUN wget http://apache.openmirror.de/karaf/${KARAF_VERSION}/apache-karaf-${KARAF_VERSION}.tar.gz; \
    mkdir $HOME/karaf; \
    mkdir $HOME/karaf/staging_area; \
    tar --strip-components=1 -C $HOME/karaf -xzf apache-karaf-${KARAF_VERSION}.tar.gz; \
    rm apache-karaf-${KARAF_VERSION}.tar.gz; \

VOLUME ["/home/r/karaf/deploy", "/home/r/karaf/staging_area"]
EXPOSE 1099 8101 8181 44444
ENTRYPOINT ["/home/r/karaf/bin/karaf"]
