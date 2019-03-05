FROM openshift/jenkins-slave-base-centos7:v3.11

MAINTAINER Marc Guillemot <mguillemot@yahoo.fr>


ENV MAVEN_VERSION=3.6.0 \
    PATH=$PATH:/opt/maven/bin


RUN curl -L --output /tmp/jdk.tar.gz https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz && \
	tar zxf /tmp/jdk.tar.gz -C /usr/lib/jvm && \
	rm /tmp/jdk.tar.gz && \
	update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-11.0.2/bin/java 20000 --family java-1.11-openjdk.x86_64 && \
	update-alternatives --set java /usr/lib/jvm/jdk-11.0.2/bin/java
	
# Install Maven
RUN curl -L --output /tmp/apache-maven-bin.zip  https://www-eu.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.zip && \
    unzip -q /tmp/apache-maven-bin.zip -d /opt && \
    ln -s /opt/apache-maven-${MAVEN_VERSION} /opt/maven && \
    rm /tmp/apache-maven-bin.zip && \
    mkdir -p $HOME/.m2


RUN chown -R 1001:0 $HOME && \
    chmod -R g+rw $HOME

ADD contrib/bin/run-jnlp-client /usr/local/bin/

USER 1001

