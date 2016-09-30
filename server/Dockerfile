FROM ubuntu:16.04 

RUN apt-get update \
 && apt-get -y install openvpn iptables

WORKDIR /etc/openvpn/

COPY server.conf *.crt dh*.pem *.csr *.key ./

EXPOSE 1194/udp
