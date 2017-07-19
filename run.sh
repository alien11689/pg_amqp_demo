#!/bin/sh

wget -nc https://raw.githubusercontent.com/rabbitmq/rabbitmq-management/rabbitmq_v3_6_10/bin/rabbitmqadmin
chmod +x rabbitmqadmin

git submodule init
git submodule update

docker-compose kill
docker-compose rm -f

docker-compose build
docker-compose up -d

sleep 10

./rabbitmqadmin declare queue name=bla
