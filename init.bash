#!/bin/bash

DIR=$(cd "$(dirname "$1")"; pwd)

[ -d keys ] && rm -rf $DIR/keys

mkdir $DIR/keys

docker build -t homevpn_gen_key gen_keys

docker run --rm --name homevpn_gen_key_1 -v $DIR/keys:/keys homevpn_gen_key /bin/bash -c "./gen_keys.bash;chown -R $(id -u):$(id -g) /keys"

cp $DIR/keys/server/* $DIR/server
