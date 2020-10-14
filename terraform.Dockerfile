FROM alpine
LABEL Name "Brian Burke" E-mail "bjburke002@gmail.com"

RUN wget -O /tmp/terraform.zip "https://releases.hashicorp.com/terraform/0.13.4/terraform_0.13.4_linux_amd64.zip" 
RUN unzip /tmp/terraform.zip -d /
RUN apk add --no-cache ca-certificates curl

USER nobody
ENTRYPOINT [ "/terraform" ]