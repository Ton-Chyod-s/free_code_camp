
/*
1 - CREATE database universe;
2 - \c universe; 

3 - CREATE table galaxy(
    galaxy_id serial PRIMARY KEY,
    name VARCHAR(30) not null UNIQUE,
    has_life BOOLEAN,
    is_spherical BOOLEAN,
    age_in_millions_of_years int,
    many_hole int,
    galaxy_types text not null,
    distance_from_earth NUMERIC(10,2)
);

CREATE table star(
    star_id serial PRIMARY KEY,
    name VARCHAR(30) not null UNIQUE,
    has_life BOOLEAN not null,
    age_in_millions_of_years int,
    distance_from_earth NUMERIC(10,2),
    galaxy_id serial,
    FOREIGN key(galaxy_id) REFERENCES galaxy(galaxy_id)
);

CREATE table planet(
    planet_id serial PRIMARY KEY,
    name VARCHAR(30) not null UNIQUE,
    has_life BOOLEAN,
    is_spherical BOOLEAN,
    age_in_millions_of_years int,
    planet_types VARCHAR(30),
    distance_from_earth NUMERIC(10,2),
    star_id serial,
    FOREIGN KEY(star_id) REFERENCES star(star_id)
);

CREATE table moon(
    moon_id serial PRIMARY KEY ,
    name VARCHAR(30) not null UNIQUE,
    age_in_millions_of_years int,
    distance_from_earth NUMERIC(10,2),
    planet_id serial,
    FOREIGN KEY(planet_id) REFERENCES planet(planet_id)
);

CREATE table join_especific_planet(
    especific_planet_id serial primary key,
    name VARCHAR(30) not null,
    galaxy_id serial UNIQUE, 
    star_id serial UNIQUE,
    planet_id serial UNIQUE,
    FOREIGN key(galaxy_id) REFERENCES galaxy(galaxy_id),
    FOREIGN KEY(star_id) REFERENCES star(star_id),
    FOREIGN key(planet_id) REFERENCES planet(planet_id)
);

4 - insert into galaxy(name,has_life,is_spherical,age_in_millions_of_years,many_hole,galaxy_types,distance_from_earth)
values ('Andrômeda-m31','yes','yes',null,2,'espiral',2000000),
('Galáxia Olho Negro','yes','yes',null,2,'espiral',2000000),
('Galáxia de Bode','yes','yes',null,2,'espiral',2000000),
('Galáxia Cartwheel','yes','yes',null,2,'espiral',2000000),
('Galáxia Charuto','yes','yes',null,2,'espiral',2000000),
('Galáxia do Cometa','yes','yes',null,2,'espiral',2000000);

insert into star(name,has_life,age_in_millions_of_years,distance_from_earth,galaxy_id)
values('Stephenson 4-18','yes',2,200000,1),
('Stephenson 3-18','yes',2,200000,2),
('UY Scuti','yes',2,200000,3),
('WOH G64','yes',2,200000,4),
('RW Cephei','yes',2,200000,5),
('SKY Cygni','yes',2,200000,6);

insert into planet(name,has_life,is_spherical,age_in_millions_of_years,planet_types,distance_from_earth,star_id)
values('Mercúrio','yes','yes',150,'oval',2,3),
('Mercúria','yes','yes',150,'oval',2,4),
('Vênus','yes','yes',150,'oval',2,5),
('Terra','yes','yes',150,'oval',2,6),
('Marte','yes','yes',150,'oval',2,7),
('Júpiter','yes','yes',150,'oval',2,8),
('Saturno','yes','yes',150,'oval',2,9),
('Urano','yes','yes',150,'oval',2,3),
('DENIS-P','yes','yes',150,'oval',2,4),
('OGLE-2005-BLG-390Lb','yes','yes',150,'oval',2,5),
('Kepler-37b','yes','yes',150,'oval',2,6),
('PSR B1620-26 b','yes','yes',150,'oval',2,7),
('V830','yes','yes',150,'oval',2,8),
('HD 195689','yes','yes',150,'oval',2,9),
('Kelt-9b','yes','yes',150,'oval',2,3);

insert into moon(name,age_in_millions_of_years,distance_from_earth,planet_id)
values('luas',384.399,150,16),
('Fobos',384.399,150,17),
('Deimos',384.399,150,18),
('Io',384.399,150,19),
('Europa',384.399,150,20),
('Ganimedes',384.399,150,21),
('Calisto',384.399,150,22),
('Amalteia',384.399,150,23),
('Himalia',384.399,150,24),
('Pasife',384.399,150,25),
('Sinope',384.399,150,26),
('Lisiteia',384.399,150,27),
('Carme',384.399,150,28),
('Disnomia',384.399,150,29),
('S/2015 (136472) 1',384.399,150,30),
('Namaka',384.399,150,26),
('Hiʻiaka',384.399,150,27),
('Estige',384.399,150,28),
('Cérbero',384.399,150,29),
('Hidra',384.399,150,30),
('Nix',384.399,150,16),
('Caronte',384.399,150,17),
('S/2004 N 1',384.399,150,18),
('Neso',384.399,150,19),
('Laomedeia',384.399,150,20);

insert into join_especific_planet(name,galaxy_id,star_id,planet_id)
values('terra',2,5,16),
('Vênus',1,4,17),
('Ceres',3,3,18);

5 - alter table moon rename moon_id to moon_id;


alter table galaxy 
add comnstraint unique_name UNIQUE(name);



ALTER TABLE moon DROP CONSTRAINT <constraint_name>;


*/