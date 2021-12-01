/* Populate database with sample data. */
BEGIN;

-- insert data into owners table
INSERT INTO owners (
  full_name,
  age
) VALUES (
  'Sam Smith',
  34
);

INSERT INTO owners (
  full_name,
  age
) VALUES (
  'Jennifer Orwell',
  19
);

INSERT INTO owners (
  full_name,
  age
) VALUES (
  'Bob',
  45
);

INSERT INTO owners (
  full_name,
  age
) VALUES (
  'Melody Pond',
  77
);

INSERT INTO owners (
  full_name,
  age
) VALUES (
  'Dean Winchester',
  14
);

INSERT INTO owners (
  full_name,
  age
) VALUES (
  'Jodie Whittaker',
  38
);

-- insert data into species table
INSERT INTO species (
  name
) VALUES (
  'Pokemon'
);

INSERT INTO species (
  name
) VALUES (
  'Digimon'
);

-- Agumon's Profile
INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg,
  species_id,
  owner_id
) VALUES (
  'Agumon',
  '2020-2-3',
  0,
  true,
  10.23,
  2,
  1
);

-- Gabumon's Profile
INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg,
  species_id,
  owner_id
) VALUES (
  'Gabumon',
  '2018-11-15',
  2,
  true,
  8,
  2,
  2
);

-- Pikachu's Profile
INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg,
  species_id,
  owner_id
) VALUES (
  'Pikachu',
  '2021-1-7',
  1,
  false,
  15.04,
  1,
  2
);

-- Devimon's Profile
INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg,
  species_id,
  owner_id
) VALUES (
  'Devimon',
  '2017-5-12',
  5,
  true,
  11,
  2,
  3
);

-- Charmander's Profile
INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg,
  species_id,
  owner_id
) VALUES (
  'Charmander',
  '2020-2-8',
  0,
  false,
  11,
  1,
  4
);

-- Plantmon's Profile
INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg,
  species_id,
  owner_id
) VALUES (
  'Plantmon',
  '2022-11-15',
  2,
  true,
  5.7,
  2,
  3
);

-- Squirtle's Profile
INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg,
  species_id,
  owner_id
) VALUES (
  'Squirtle',
  '1993-4-2',
  3,
  false,
  12.13,
  1,
  4
);

-- Angemon's Profile
INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg,
  species_id,
  owner_id
) VALUES (
  'Angemon',
  '2005-6-12',
  1,
  true,
  45,
  2,
  5
);

-- Boarmon's Profile
INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg,
  species_id,
  owner_id
) VALUES (
  'Boarmon',
  '2005-6-7',
  7,
  true,
  20.4,
  2,
  5
);

-- Blossom's Profile
INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg,
  species_id,
  owner_id
) VALUES (
  'Blossom',
  '1998-10-13',
  3,
  true,
  17,
  1,
  4
);

COMMIT;
