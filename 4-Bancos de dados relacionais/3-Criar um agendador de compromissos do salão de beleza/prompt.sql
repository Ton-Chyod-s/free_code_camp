create database salon;

/* \c salon; */

create table services(
  service_id serial primary key,
  name varchar not null
);
create table customers(
  customer_id serial primary key,
  service_id int not null,
  name varchar not null,
  phone varchar unique not null,
  FOREIGN KEY (service_id) REFERENCES services(service_id)
);
create table appointments(
  appointment_id serial primary key,
  customer_id int not null,
  service_id int not null,
  FOREIGN KEY (service_id) REFERENCES services(service_id),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  name varchar not null,
  time varchar
);

/* 

touch salon.sh; 
chmod +x salon.sh; 
 
insert into services(name) values('cut'), ('color'), ('perm'), ('style'), ('trim');

DROP TABLE  appointments CASCADE;
DROP TABLE services CASCADE;
DROP TABLE customers CASCADE;

*/

