FROM jenkins/jenkins:2.289.1-jdk11

USER root
RUN curl -fsSL https://get.docker.com/ | sh
RUN usermod -aG docker jenkins
RUN newgrp root
#USER jenkins
USER root

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

COPY seedJob.xml /usr/share/jenkins/ref/jobs/seed-job/config.xml

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false