FROM ubuntu:16.04 

RUN apt-get update \
 && apt-get -y install openvpn inetutils-tools inetutils-ping

WORKDIR /etc/openvpn/

COPY client.conf *.crt *.csr *.key ./

