FROM ubuntu:16.10

ADD pg_amqp /pg_amqp

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y postgresql postgresql-server-dev-9.5 wget unzip make gcc

RUN cd /pg_amqp && make && make install

RUN echo "shared_preload_libraries = 'pg_amqp.so'" >> /etc/postgresql/9.5/main/postgresql.conf
RUN echo "listen_addresses = '*'" >> /etc/postgresql/9.5/main/postgresql.conf

RUN sed -i -e  "s#127.0.0.1/32#all#" /etc/postgresql/9.5/main/pg_hba.conf

RUN /etc/init.d/postgresql start && \
	su - postgres -c "psql -U postgres -d postgres -c \"ALTER USER postgres WITH PASSWORD 'postgres'; \" " && \
	su - postgres -c "psql -U postgres -d postgres -c 'create extension amqp ;' " && \
	su - postgres -c "psql -U postgres -d postgres -c 'alter table amqp.broker add column name varchar(32) not null;' " && \
	su - postgres -c "psql -U postgres -d postgres -c \"insert into amqp.broker (name, host, port, vhost, username, password) values ('rabbit1', 'rmq', 5672, '/', 'guest', 'guest');\" " && \
	/etc/init.d/postgresql stop

CMD /etc/init.d/postgresql start && tail -f /var/log/postgresql/postgresql-9.5-main.log
