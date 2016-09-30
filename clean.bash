#!/bin/bash

DIR=$(cd "$(dirname "$1")"; pwd)

# stop and rm containers
$DIR/stop_clients.bash
$DIR/stop_server.bash

rm -rf $DIR/keys/*

rm -f $DIR/server/*.crt $DIR/server/dh*.pem $DIR/server/*.csr $DIR/server/*.key

rm -f $DIR/client/*.crt $DIR/client/*.csr $DIR/client/*.key

cd client
rm -r */

cd $DIR
