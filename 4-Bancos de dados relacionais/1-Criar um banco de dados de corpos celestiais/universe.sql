
/*
1 - CREATE database universe;
2 - \c universe; 

3 - CREATE table galaxy(
    galaxy_id serial PRIMARY KEY UNIQUE,
    name VARCHAR(30) not null,
    has_life BOOLEAN,
    is_spherical BOOLEAN,
    age_in_millions_of_years int,
    many_hole int,
    galaxy_types text not null,
    distance_from_earth NUMERIC(10,2)
);

CREATE table star(
    star_id serial PRIMARY KEY UNIQUE,
    name VARCHAR(30) not null,
    has_life BOOLEAN not null,
    age_in_millions_of_years int,
    distance_from_earth NUMERIC(10,2),
    galaxy_id serial,
    FOREIGN key(galaxy_id) REFERENCES galaxy(galaxy_id)
);

CREATE table planet(
    planet_id serial PRIMARY KEY UNIQUE,
    name VARCHAR(30) not null,
    has_life BOOLEAN,
    is_spherical BOOLEAN,
    age_in_millions_of_years int,
    planet_types VARCHAR(30),
    distance_from_earth NUMERIC(10,2),
    star_id serial,
    FOREIGN KEY(star_id) REFERENCES star(star_id)
);

CREATE table moon(
    moon_id serial PRIMARY KEY UNIQUE,
    name VARCHAR(30) not null,
    age_in_millions_of_years int,
    distance_from_earth NUMERIC(10,2),
    planet_id serial,
    FOREIGN KEY(planet_id) REFERENCES planet(planet_id)
);

CREATE table join_especific_planet(
    especific_planet_id serial primary key,
    name VARCHAR(30) not null,
    galaxy_id serial, 
    star_id serial,
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
values('Stephenson 2-18','yes',2,200000,2),
('Stephenson 2-18','yes',2,200000,3),
('UY Scuti','yes',2,200000,4),
('WOH G64','yes',2,200000,1),
('RW Cephei','yes',2,200000,6),
('SKY Cygni','yes',2,200000,5);

insert into planet(name,has_life,is_spherical,age_in_millions_of_years,planet_types,distance_from_earth,star_id)
values('Mercúrio','yes','yes',150,'oval',2,1),
('Mercúrio','yes','yes',150,'oval',2,2),
('Vênus','yes','yes',150,'oval',2,3),
('Terra','yes','yes',150,'oval',2,4),
('Marte','yes','yes',150,'oval',2,5),
('Júpiter','yes','yes',150,'oval',2,6),
('Saturno','yes','yes',150,'oval',2,null),
('Urano','yes','yes',150,'oval',2,null),
('DENIS-P','yes','yes',150,'oval',2,null),
('OGLE-2005-BLG-390Lb','yes','yes',150,'oval',2,null),
('Kepler-37b','yes','yes',150,'oval',2,null),
('PSR B1620-26 b','yes','yes',150,'oval',2,null),
('V830','yes','yes',150,'oval',2,null),
('HD 195689','yes','yes',150,'oval',2,null),
('Kelt-9b','yes','yes',150,'oval',2,null);

insert into moon(name,age_in_millions_of_years,distance_from_earth,planet_id)
values('luas',384.399,150,4),
('Fobos',384.399,150,3),
('Deimos',384.399,150,5),
('Io',384.399,150,7),
('Europa',384.399,150,9),
('Ganimedes',384.399,150,3),
('Calisto',384.399,150,4),
('Amalteia',384.399,150,1),
('Himalia',384.399,150,12),
('Pasife',384.399,150,10),
('Sinope',384.399,150,9),
('Lisiteia',384.399,150,6),
('Carme',384.399,150,7),
('Disnomia',384.399,150,3),
('S/2015 (136472) 1',384.399,150,5),
('Namaka',384.399,150,7),
('Hiʻiaka',384.399,150,9),
('Estige',384.399,150,3),
('Cérbero',384.399,150,4),
('Hidra',384.399,150,1),
('Nix',384.399,150,12),
('Caronte',384.399,150,10),
('S/2004 N 1',384.399,150,9),
('Neso',384.399,150,6),
('Laomedeia',384.399,150,7);

insert into join_especific_planet(name,galaxy_id,star_id,planet_id)
values('terra',2,4,6),
('Vênus',1,3,8),
('Ceres',3,1,7);

5 - alter table moon rename moon_id to moon_id;


alter table galaxy 
add comnstraint unique_name UNIQUE(name);



ALTER TABLE moon DROP CONSTRAINT <constraint_name>;


*/