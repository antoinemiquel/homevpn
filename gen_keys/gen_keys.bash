#!/bin/bash

DIR=$(cd "$(dirname "$1")"; pwd)

cd $DIR

. ./vars
./clean-all
./pkitool --initca
./pkitool --server server
./build-dh

cd keys

mkdir -p /keys/ca /keys/server

# Copy keys
cp ../vars /keys/ca
cp ca* /keys/ca
cp index.txt serial /keys/ca

# Copy Server keys
cp server* dh*.pem ca.crt /keys/server

exit 0
