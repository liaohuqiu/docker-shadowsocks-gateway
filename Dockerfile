FROM easypi/shadowsocks-libev
RUN apk add -U iproute2 ipset && ln -s /usr/lib/tc /lib/tc
