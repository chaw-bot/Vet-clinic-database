/*Queries that provide answers to the questions from all projects.*/

-- Find all animals whose name ends in "mon".
SELECT * from animals WHERE name LIKE '%mon';

-- List the name of all animals born between 2016 and 2019.
SELECT * from animals WHERE date_of_birth BETWEEN '2016-1-1' AND '2019-1-1';

-- List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT * from animals WHERE neutered = true AND escape_attempts < 3;

-- List date of birth of all animals named either "Agumon" or "Pikachu".
SELECT date_of_birth from animals WHERE name IN ('Agumon', 'Pikachu');

-- List name and escape attempts of animals that weigh more than 10.5kg
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;

-- Find all animals that are neutered.
SELECT * from animals WHERE neutered = true;

-- Find all animals not named Gabumon.
SELECT * from animals WHERE NOT name = 'Gabumon';

-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


-- How many animals are there?
SELECT COUNT(*) FROM animals;

-- How many animals have never tried to escape?
SELECT 
  COUNT(name)
FROM
  animals
WHERE escape_attempts = 0;

-- What is the average weight of animals?
SELECT
  AVG(weight_kg)
FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT
  name, escape_attempts
FROM
  animals
WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);

-- What is the minimum and maximum weight of each type of animal?
SELECT
  species, MAX(weight_kg), MIN(weight_kg)
FROM
  animals
GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT
  species, AVG(escape_attempts)
FROM
  animals
WHERE date_of_birth BETWEEN '1990-1-1' AND '2000-1-1'
GROUP BY species;


-- Write queries (using JOIN) to answer the following questions:

-- What animals belong to Melody Pond?
SELECT name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name
FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT animals.name, owners.full_name
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;

-- How many animals are there per species?
SELECT species.name, COUNT(species.name)
FROM animals
JOIN species ON animals.species_id = species.id
GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT animals.name, owners.full_name, species.name
FROM animals
JOIN species ON animals.species_id = species.id
JOIN owners ON owners.id = animals.owner_id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.name, owners.full_name, animals.escape_attempts
FROM animals
JOIN owners ON owners.id = animals.owner_id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

-- Who owns the most animals?
SELECT owners.full_name, COUNT(animals.name)
FROM animals
JOIN owners ON owners.id = animals.owner_id
GROUP BY owners.full_name;