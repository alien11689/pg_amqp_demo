select broker_id from amqp.broker where name = 'rabbit1';

SELECT amqp.publish(1, '', 'bla', '<test1/>');

begin;
SELECT amqp.publish(1, '', 'bla', '<test2/>');
SELECT amqp.publish(1, '', 'bla', '<test3/>');
commit; 

begin;
SELECT amqp.publish(1, '', 'bla', '<test4/>');
SELECT amqp.publish(1, '', 'bla', '<test5/>');
rollback; 

