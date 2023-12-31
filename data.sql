/* Populate database with sample data. */

INSERT INTO animals (name , date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Agumon','2020-02-03', 10.23, TRUE, 0);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Gabumon', '2018-11-15', 8, TRUE, 2);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Pikachu', '2021-01-07', 15.04, FALSE, 1);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Devimon', '2017-05-12', 11, TRUE, 5);

--2
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts, species)
VALUES
('Charmander', '2020-02-08', -11.00, FALSE, 0, 'Unspecified'),
('Plantmon', '2021-11-15', -5.70, TRUE, 2, 'Unspecified'),
('Squirtle', '1993-04-02', -12.13, FALSE, 3, 'Unspecified'),
('Angemon', '2005-06-12', -45.00, TRUE, 1, 'Unspecified'),
('Boarmon', '2005-06-07', 20.40, TRUE, 7, 'Unspecified'),
('Blossom', '1998-10-13', 17.00, TRUE, 3, 'Unspecified'),
('Ditto', '2022-05-14', 22.00, TRUE, 4, 'Unspecified');

--3
INSERT INTO owners (full_name, age) VALUES
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES
    ('Pokemon'),
    ('Digimon');


UPDATE animals
SET
    species_id = (CASE
        WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
        ELSE (SELECT id FROM species WHERE name = 'Pokemon')
    END),
    owner_id = (CASE
        WHEN name = 'Agumon' THEN (SELECT id FROM owners WHERE full_name = 'Sam Smith')
        WHEN name IN ('Gabumon', 'Pikachu') THEN (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
        WHEN name IN ('Devimon', 'Plantmon') THEN (SELECT id FROM owners WHERE full_name = 'Bob')
        WHEN name IN ('Charmander', 'Squirtle', 'Blossom') THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond')
        WHEN name IN ('Angemon', 'Boarmon') THEN (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
        ELSE NULL
    END);

    -- 4 

    INSERT INTO vets (name, age, date_of_graduation) VALUES
    ('William Tatcher', 45, '2000-04-23'),
    ('Maisy Smith', 26, '2019-01-17'),
    ('Stephanie Mendez', 64, '1981-05-04'),
    ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (vet_id, species_id) VALUES
    (1, (SELECT id FROM species WHERE name = 'Pokemon')),
    (3, (SELECT id FROM species WHERE name = 'Digimon')),
    (3, (SELECT id FROM species WHERE name = 'Pokemon')),
    (4, (SELECT id FROM species WHERE name = 'Digimon'));

    INSERT INTO visits (animal_id, vet_id, visit_date) VALUES
    (1, 1, '2020-05-24'),
    (1, 3, '2020-07-22'),
    (2, 4, '2021-02-02'),
    (3, 2, '2020-01-05'),
    (3, 2, '2020-03-08'),
    (3, 2, '2020-05-14'),
    (4, 3, '2021-05-04'),
    (5, 4, '2021-02-24'),
    (6, 2, '2019-12-21'),
    (6, 1, '2020-08-10'),
    (6, 2, '2021-04-07'),
    (7, 3, '2019-09-29'),
    (8, 4, '2020-10-03'),
    (8, 4, '2020-11-04'),
    (9, 2, '2019-01-24'),
    (9, 2, '2019-05-15'),
    (9, 2, '2020-02-27'),
    (9, 2, '2020-08-03'),
    (10, 3, '2020-05-24'),
    (10, 1, '2021-01-11');