#!/bin/bash

if [ $# -ne 1 ]
then
	echo "The name of the client is needed"
	echo "Usage : gen_client.bash \"client_name\" "
	exit 1
fi

CLIENT_NAME=$1

DIR=$(cd "$(dirname "$1")"; pwd)

cd $DIR

if [ ! -d client/${CLIENT_NAME} ]
then
	echo "${CLIENT_NAME} keys haven't been generated. Please run before :"
	echo "gen_client.bash ${CLIENT_NAME}"
	exit 2
fi

cp client/Dockerfile client/${CLIENT_NAME}

docker build -t homevpn_client client/${CLIENT_NAME}

rm client/${CLIENT_NAME}/Dockerfile

docker run -d --name homevpn_client_${CLIENT_NAME} --cap-add=NET_ADMIN --device=/dev/net/tun homevpn_client /bin/bash -c "openvpn client.conf"
