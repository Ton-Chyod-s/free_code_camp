
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
    name VARCHAR(30) not null,
    has_life BOOLEAN,
    is_spherical BOOLEAN,
    age_in_millions_of_years VARCHAR(15) UNIQUE,
    planet_types VARCHAR(30),
    distance_from_earth NUMERIC(10,2),
    star_id serial,
    FOREIGN KEY(star_id) REFERENCES star(star_id)
);

CREATE table moon(
    moon_id serial PRIMARY KEY ,
    name VARCHAR(30) not null,
    age_in_millions_of_years VARCHAR(15) UNIQUE,
    distance_from_earth NUMERIC(10,2),
    planet_id serial,
    FOREIGN KEY(planet_id) REFERENCES planet(planet_id)
);

CREATE table join_table(
    join_table_id serial primary key,
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
values('Stephenson 4-18','yes',2,200000,1),
('Stephenson 3-18','yes',2,200000,2),
('UY Scuti','yes',2,200000,3),
('WOH G64','yes',2,200000,4),
('RW Cephei','yes',2,200000,5),
('SKY Cygni','yes',2,200000,6);

insert into planet(name,has_life,is_spherical,age_in_millions_of_years,planet_types,distance_from_earth,star_id)
values('Mercúrio','yes','yes','150.1','oval',2,1),
('Mercúria','yes','yes','150.2','oval',2,2),
('Vênus','yes','yes','150.3','oval',2,3),
('Terra','yes','yes','150.4','oval',2,4),
('Marte','yes','yes','150.5','oval',2,5),
('Júpiter','yes','yes','150.6','oval',2,6),
('Saturno','yes','yes','150.7','oval',2,1),
('Urano','yes','yes','150.8','oval',2,2),
('DENIS-P','yes','yes','150.9','oval',2,3),
('OGLE-2005-BLG-390Lb','yes','yes','150.10','oval',2,4),
('Kepler-37b','yes','yes','150.11','oval',2,5),
('PSR B1620-26 b','yes','yes','150.12','oval',2,6),
('V830','yes','yes','150.13','oval',2,1),
('HD 195689','yes','yes','150.14','oval',2,2),
('Kelt-9b','yes','yes','150.15','oval',2,3);

insert into moon(name,age_in_millions_of_years,distance_from_earth,planet_id)
values('luas','384.391',150,1),
('Fobos','384.392',150,2),
('Deimos','384.393',150,3),
('Io','384.394',150,4),
('Europa','384.395',150,5),
('Ganimedes','384.396',150,6),
('Calisto','384.397',150,7),
('Amalteia','384.398',150,8),
('Himalia','385.391',150,9),
('Pasife','384.400',150,10),
('Sinope','384.401',150,11),
('Lisiteia','384.402',150,12),
('Carme','384.403',150,13),
('Disnomia','384.404',150,14),
('S/2015 (136472) 1','384.405',150,15),
('Namaka','384.406',150,1),
('Hiʻiaka','384.407',150,2),
('Estige','384.408',150,3),
('Cérbero','384.409',150,4),
('Hidra','384.410',150,5),
('Nix','384.399',411,6),
('Caronte','384.412',150,1),
('S/2004 N 1','384.413',150,2),
('Neso','384.414',150,3),
('Laomedeia','384.415',150,4);

insert into join_table(name,galaxy_id,star_id,planet_id)
values('terra',2,5,2),
('Vênus',1,4,4),
('Ceres',3,3,6);

*/