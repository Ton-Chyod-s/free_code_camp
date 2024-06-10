/*
\c periodic_table

alter table properties rename column weight to atomic_mass;
alter table properties rename column melting_point to melting_point_celsius;
alter table properties rename column boiling_point to boiling_point_celsius;

alter table properties alter column melting_point_celsius set not null;
alter table properties alter column boiling_point_celsius set not null;

alter table elements add constraint unique_name UNIQUE(name);
alter table elements add constraint unique_symbol UNIQUE(symbol);

alter table elements alter column name set not null;
alter table elements alter column symbol set not null;

alter table properties ADD CONSTRAINT fk_atomic_number foreign key (atomic_number) references elements(atomic_number);

create table types( type_id int primary key, type varchar not null);

insert into types (type_id, type) values (1, 'nonmetal');
insert into types (type_id, type) values (2, 'metal');
insert into types (type_id, type) values (3, 'metalloid');

alter table properties add columns type_id int not null add constraint fk_type_id foreign key (type_id) references types(type_id);

ALTER TABLE Properties ADD COLUMN type_id INT;
UPDATE properties SET type_id = (SELECT type_id FROM types WHERE types.type = properties.type);
alter table properties alter column type_id set not null;

alter table properties add constraint fk_type_id foreign key (type_id) references types(type_id);

update elements set symbol = initcap(symbol);

UPDATE properties SET atomic_mass = atomic_mass::REAL;
alter table properties alter column atomic_mass type real;

insert into elements(atomic_number, symbol, name) values(10, 'Ne', 'Neon');

insert into elements(atomic_number, symbol, name) values(9, 'F', 'Fluorine');

insert into properties(atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) values(10,'nonmetal','20.18','-248.6','-246.1',1);

insert into properties(atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) values(9,'nonmetal','18.998','-220','-188.1',1);

mkdir periodic_table
git init









#! /bin/bash

PSQL="psql -U postgres -t --no-align --dbname=periodic_table"

touch element.sh
*/