#!/bin/sh

git submodule init
git submodule update

docker-compose kill
docker-compose rm -f

docker-compose build
docker-compose up -d

sleep 10

./rabbitmqadmin declare queue name=bla
