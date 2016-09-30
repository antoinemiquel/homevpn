#!/bin/bash

if [ $# -ne 1 ]
then
	echo "The name of the client is needed"
	echo "Usage : gen_keys_clients.bash \"client_name\" "
	exit 1
fi

CLIENT_NAME=$1

cp /keys/ca/vars .
. ./vars

./clean-all

cp /keys/ca/ca.* keys

./pkitool client

cd keys

# Copy Clients keys
cp client* ca.crt /keys/client/${CLIENT_NAME}

exit 0
