FROM jenkins/jenkins:alpine
LABEL Name "Brian Burke" E-mail "bjburke002@gmail.com"

COPY plugins.txt /usr/share/jenkins/plugins.txt
# Feed plugins file to built in Jenkins plugin install shell
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt

EXPOSE 8080