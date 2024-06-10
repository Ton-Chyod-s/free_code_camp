/*
touch element.sh

\c periodic_table

alter table properties rename column weight to atomic_mass;
alter table properties rename column melting_point to melting_point_celsius;
alter table properties rename column boiling_point to boiling_point_celsius;

alter table properties alter column melting_point_celsius set not null;
alter table properties alter column boiling_point_celsius set not null;

alter table elements add constraint unique_name UNIQUE(name);
alter table elements add constraint unique_symbol UNIQUE(symbol);

*/