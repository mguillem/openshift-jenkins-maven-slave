# openshift-jenkins-maven-slave
Maven Slave Image for Jenkins on OpenShift with Java 11.

Similar to the ["official" image](https://github.com/openshift/jenkins/tree/master/agent-maven-3.5) but using:
- Maven 3.6
- OpenJDK 11

The Docker image is available on [DockerHub](https://hub.docker.com/r/mguillem/openshift-jenkins-maven-slave):

`mguillem/openshift-jenkins-maven-slave:v3.11`

# Motivation

The [Openshift Jenkins Repository](https://github.com/openshift/jenkins) contains ready to use slave image with OpenJDK 8 but none for Java 11 (see 
[Issue 722](https://github.com/openshift/jenkins/issues/722#issuecomment-429106898)).



# Configuration

In Jenkins administration, add a new Kubernetes Pod Template (or change an existing one) to use the image `mguillem/openshift-jenkins-maven-slave:v3.11`
 
![Configuration](config-screenshot.png)
