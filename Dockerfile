FROM alpine:latest

RUN apk add hugo bash git

COPY ./src/init.sh /root/init.sh
COPY ./src/hugo.yaml /root/hugo.yaml
RUN chmod +x /root/init.sh

WORKDIR /srv/

ENTRYPOINT [ "sh", "/root/init.sh" ]
