-- inside a transaction update the animals table by setting the species column to unspecified
BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon
BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

-- Inside a transaction delete all records in the animals table, then roll back the transaction.
BEGIN;
DELETE FROM animals;
ROLLBACK;

SELECT * FROM animals;

BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-1-1';
SAVEPOINT delete_by_date_of_birth;
UPDATE animals
SET weight_kg = weight_kg * (-1);
ROLLBACK TO delete_by_date_of_birth;
UPDATE animals
SET weight_kg = weight_kg * (-1)
WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;