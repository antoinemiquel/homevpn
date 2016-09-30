FROM ubuntu:16.04 

RUN apt-get update \
 && apt-get -y install openvpn easy-rsa

RUN ["mkdir","/root/openvpn"]

RUN ["cp","/usr/share/easy-rsa","/root/openvpn","-R"]

WORKDIR /root/openvpn/easy-rsa

COPY vars gen_keys.bash gen_keys_clients.bash ./

VOLUME /keys
