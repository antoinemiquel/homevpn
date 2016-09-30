#!/bin/bash

if [ $# -ne 1 ]
then
	echo "The name of the client is needed"
	echo "Usage : gen_client.bash \"client_name\" "
	exit 1
fi

CLIENT_NAME=$1

DIR=$(cd "$(dirname "$1")"; pwd)

[ -d $DIR/keys/client/${CLIENT_NAME} ] && rm -rf $DIR/keys/client/${CLIENT_NAME}
mkdir -p $DIR/keys/client/${CLIENT_NAME}

docker run --rm --name homevpn_gen_key_1 -v $DIR/keys:/keys homevpn_gen_key /bin/bash -c "./gen_keys_clients.bash ${CLIENT_NAME};chown -R $(id -u):$(id -g) /keys"

[ -d $DIR/client/${CLIENT_NAME} ] && rm -rf $DIR/client/${CLIENT_NAME}
mkdir $DIR/client/${CLIENT_NAME}

cp $DIR/keys/client/${CLIENT_NAME}/* $DIR/client/${CLIENT_NAME}
cp $DIR/client/client.conf $DIR/client/${CLIENT_NAME}
