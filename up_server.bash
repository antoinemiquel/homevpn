#!/bin/bash

DIR=$(cd "$(dirname "$1")"; pwd)

docker build -t homevpn_server server

docker run -d --name homevpn_server_1 -p 1194:1194/udp --cap-add=NET_ADMIN --device=/dev/net/tun homevpn_server /bin/bash -c "iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE;openvpn server.conf"
