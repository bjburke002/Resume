# escape=`

FROM nginx:alpine
LABEL Name "Brian Burke" E-mail "bjburke002@gmail.com"

COPY website /website
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
