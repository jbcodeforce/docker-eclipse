FROM ubuntu
MAINTAINER jerome.boyer@gmail.com

# Add OS update and add Java openjdk
RUN apt-get update &&  apt-get install -y openjdk-8-jdk  \
&& apt-get install -y ca-certificates-java \
&& apt-get clean

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
RUN export JAVA_HOME

RUN apt-get -y install wget 
RUN wget http://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/2018-09/R/eclipse-java-2018-09-linux-gtk-x86_64.tar.gz -O /tmp/eclipse.tar.gz -q \
&& echo 'Installing eclipse' && tar -xf /tmp/eclipse.tar.gz -C /opt \
  &&  rm /tmp/eclipse.tar.gz && ln -s /opt/eclipse/eclipse /usr/local/bin/eclipse 

RUN  apt-get -y install apt-utils \
   && apt-get -y install openssh-server sudo \
   &&  apt-get -y install vim net-tools \
   &&  apt-get -y install libxext-dev libxrender-dev libxtst-dev \
   && mkdir -p /home/developer \
   && echo "developer:x:1000:1000:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd \
   && echo "developer:x:1000:" >> /etc/group \
   && chown developer:developer -R /home/developer \
   && echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer \
   && chmod 0440 /etc/sudoers.d/developer
USER developer
ENV HOME /home/developer
WORKDIR /home/developer
