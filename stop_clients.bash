#!/bin/bash

stop_remove_container()
{
	CONTAINER_NAME=$1
	docker ps | grep $CONTAINER_NAME 2>&1 >/dev/null
	if [ $? -eq 0 ]
	then
		docker stop $CONTAINER_NAME
	fi 
	docker ps -a | grep $CONTAINER_NAME 2>&1 >/dev/null
	if [ $? -eq 0 ]
	then
		docker rm $CONTAINER_NAME
	fi 
}

# Stop and remove client container(s) :

for CONT in `docker ps -a -f name=homevpn_client --format "{{.Names}}"`
do
	stop_remove_container $CONT
done
