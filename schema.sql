/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id serial PRIMARY KEY,
    name varchar(255),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal(5,2)
);

--2

ALTER TABLE animals
ADD species VARCHAR(100);

--3
CREATE TABLE owners (
    id serial PRIMARY KEY,
    full_name varchar(255),
    age integer
);

CREATE TABLE species (
    id serial PRIMARY KEY,
    name varchar(255)
);

ALTER TABLE animals
ADD COLUMN species_id integer REFERENCES species(id),
ADD COLUMN owner_id integer REFERENCES owners(id);