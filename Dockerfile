FROM easypi/shadowsocks-libev
RUN apk add -U iproute2 ipset && ln -s /usr/lib/tc /lib/tc

ADD ./chinadns_chnroute.txt /etc/chinadns_chnroute.txt
ADD ./ss-rules /usr/local/bin/

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 8388
ENV METHOD      aes-256-cfb
ENV PASSWORD=
ENV WAN_BP_IPS=

CMD ss-rules -s $SERVER_ADDR -l 1080 -n eth0 -i /etc/chinadns_chnroute.txt -b $WAN_BP_IPS -o && \
    ss-redir -u -s $SERVER_ADDR -p $SERVER_PORT -b 0.0.0.0 -l 1080 -m $METHOD -k $PASSWORD
