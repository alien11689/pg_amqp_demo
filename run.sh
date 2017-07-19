#!/bin/sh

docker-compose kill
docker-compose rm -f

docker-compose build
docker-compose up -d

sleep 10

./rabbitmqadmin declare queue name=bla
