# pg-amqp-demo

Sending messages to RabbitMQ via postgres function

`pg_amqp` is an extenstion described [here](https://postgrespro.co.il/blog/postresql-and-rabbitmq/) with little change beacause postgres SPI has changed[(source)](https://github.com/alien11689/pg_amqp).

## Usage

1. Run dockers with `./run.sh`
2. Connect to postgres - localhost:5432 as postgres:postgres
3. Play with queries from `example.sql`
