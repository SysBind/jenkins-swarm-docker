FROM alpine:latest

RUN apk update \
    && apk upgrade \
    && apk add postfix \
    && postconf -e relayhost=[smtp-relay.gmail.com]:587 \
    && postconf -e smtp_use_tls=yes
    
CMD postfix start