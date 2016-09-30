# homevpn
 
## overview

This project use docker to create a vpn server with openvpn.
(creating pki, server and optinnaly optionally clients)

-------- 
## quick start

* generate CA and server keys
    * rename and complete file **gen_keys/vars_sample** in **gen_keys/vars** with your informations for generate your Certificate Authority :
        *   KEY_COUNTRY
        *   KEY_PROVINCE
        *   KEY_CITY
        *   KEY_ORG
        *   KEY_MAIL
    * execute `./init.bash` (CA, server keys will be created in **keys** directory and distributed in **server** dir)

* start vpn-server
    * execute `./up_server.bash`

* generate client keys (one client keys will be generated each time)
    * rename and complete file **client/client_sample.conf** in **client/client.conf** with address of your vpn-server in your network, for example (several lines are possible) :
        * remote 192.168.0.10 1194
        * remote myhome.johndoe.com 1194

	* execute `./gen_client.bash _nom_client_ (client keys will be created in **keys/client/_nom_client_** directory and distributed in **client/_nom_client_** dir)

* start vpn-client [ optionally ]
    * execute `./up_client.bash _nom_client_`

--------
## notes

* stop server and client : `./stop.bash`

* stop server and client, remove all keys : `./clean.bash`

* connect to vpn-server : `docker exec -it homevpn_server_1 /bin/bash`

* connect to vpn-client : `docker exec -it homevpn_client_1 /bin/bash`

* if docker-host has firewall, it could be necessary to open udp 1194 on your local network interface.
    * for example : `sudo iptables -A INPUT -p udp -i eth0 --dport 1194 -j ACCEPT`

* if you want to connect to your server via Internet :
    * configure router NAT to redirect UDP port 1194 to reach your vpn-server
    * obtain an fix ip (for example dyn.com/dns/)

* for windows, ios or android device, rename **client.conf** in **client.ovpn**
