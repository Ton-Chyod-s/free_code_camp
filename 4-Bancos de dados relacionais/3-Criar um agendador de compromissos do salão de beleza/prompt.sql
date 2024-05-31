create database salon;

/* \c salon; */

create table customers(
  customer_id serial primary key,
  phone varchar unique


);

create table appointments(
  appointment_id serial primary key,
  customer_id int not null,
  service_id int not null,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  name varchar not null,
  time varchar

);

create table services(
  service_id serial primary key,
  name varchar not null,
  FOREIGN KEY (service_id) REFERENCES appointments(service_id)

);