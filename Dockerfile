FROM alpine:latest

RUN apk add hugo bash git

COPY ./src/init.sh /root/init.sh
RUN chmod +x /root/init.sh

WORKDIR /srv/

ENTRYPOINT [ "sh", "/root/init.sh" ]
