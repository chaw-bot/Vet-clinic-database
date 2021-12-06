-- /*Queries that provide answers to the questions from all projects.*/

-- -- Find all animals whose name ends in "mon".
-- SELECT * from animals WHERE name LIKE '%mon';

-- -- List the name of all animals born between 2016 and 2019.
-- SELECT * from animals WHERE date_of_birth BETWEEN '2016-1-1' AND '2019-1-1';

-- -- List the name of all animals that are neutered and have less than 3 escape attempts.
-- SELECT * from animals WHERE neutered = true AND escape_attempts < 3;

-- -- List date of birth of all animals named either "Agumon" or "Pikachu".
-- SELECT date_of_birth from animals WHERE name IN ('Agumon', 'Pikachu');

-- -- List name and escape attempts of animals that weigh more than 10.5kg
-- SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;

-- -- Find all animals that are neutered.
-- SELECT * from animals WHERE neutered = true;

-- -- Find all animals not named Gabumon.
-- SELECT * from animals WHERE NOT name = 'Gabumon';

-- -- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
-- SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


-- -- How many animals are there?
-- SELECT COUNT(*) FROM animals;

-- -- How many animals have never tried to escape?
-- SELECT 
--   COUNT(name)
-- FROM
--   animals
-- WHERE escape_attempts = 0;

-- -- What is the average weight of animals?
-- SELECT
--   AVG(weight_kg)
-- FROM animals;

-- -- Who escapes the most, neutered or not neutered animals?
-- SELECT
--   name, escape_attempts
-- FROM
--   animals
-- WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);

-- -- What is the minimum and maximum weight of each type of animal?
-- SELECT
--   species, MAX(weight_kg), MIN(weight_kg)
-- FROM
--   animals
-- GROUP BY species;

-- -- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
-- SELECT
--   species, AVG(escape_attempts)
-- FROM
--   animals
-- WHERE date_of_birth BETWEEN '1990-1-1' AND '2000-1-1'
-- GROUP BY species;


-- -- Write queries (using JOIN) to answer the following questions:

-- -- What animals belong to Melody Pond?
-- SELECT name
-- FROM animals
-- JOIN owners ON animals.owner_id = owners.id
-- WHERE full_name = 'Melody Pond';

-- -- List of all animals that are pokemon (their type is Pokemon).
-- SELECT animals.name
-- FROM animals
-- JOIN species ON animals.species_id = species.id
-- WHERE species.name = 'Pokemon';

-- -- List all owners and their animals, remember to include those that don't own any animal.
-- SELECT animals.name, owners.full_name
-- FROM owners
-- LEFT JOIN animals ON owners.id = animals.owner_id;

-- -- How many animals are there per species?
-- SELECT species.name, COUNT(species.name)
-- FROM animals
-- JOIN species ON animals.species_id = species.id
-- GROUP BY species.name;

-- -- List all Digimon owned by Jennifer Orwell.
-- SELECT animals.name, owners.full_name, species.name
-- FROM animals
-- JOIN species ON animals.species_id = species.id
-- JOIN owners ON owners.id = animals.owner_id
-- WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

-- -- List all animals owned by Dean Winchester that haven't tried to escape.
-- SELECT animals.name, owners.full_name, animals.escape_attempts
-- FROM animals
-- JOIN owners ON owners.id = animals.owner_id
-- WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

-- -- Who owns the most animals?
-- SELECT owners.full_name, COUNT(animals.name)
-- FROM animals
-- JOIN owners ON owners.id = animals.owner_id
-- GROUP BY owners.full_name;

-- -- Join tables queries
-- -- Who was the last animal seen by William Tatcher?
-- SELECT animals.name, vets.name, date_of_visit
-- FROM visits
-- JOIN animals ON animals.id = animals_id
-- JOIN vets ON vets.id = vets_id
-- WHERE vets.name = 'William Tatcher'
-- ORDER BY date_of_visit DESC LIMIT 1;

-- -- How many different animals did Stephanie Mendez see?
-- SELECT vets.name, COUNT(animals_id)
-- FROM visits
-- JOIN animals ON animals.id = animals_id
-- JOIN vets ON vets.id = vets_id
-- WHERE vets.name = 'Stephanie Mendez'
-- GROUP BY vets.name;

-- -- List all vets and their specialties, including vets with no specialties.
-- SELECT vets.name, species.name
-- FROM vets
-- LEFT JOIN specializations ON vet_id = vets.id
-- LEFT JOIN species ON species_id = species.id;

-- -- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
-- SELECT animals.name
-- FROM visits
-- JOIN animals ON animals_id = animals.id
-- JOIN vets ON vets_id = vets.id
-- WHERE date_of_visit BETWEEN '2020-4-1' AND '2020-8-30' AND vets.name = 'Stephanie Mendez'
-- ORDER BY animals.name;

-- -- What animal has the most visits to vets?
-- SELECT animals.name, COUNT(animals.name)
-- FROM visits
-- JOIN animals ON animals_id = animals.id
-- JOIN vets ON vets_id = vets.id
-- GROUP BY animals.name
-- ORDER BY COUNT(animals.name) DESC LIMIT 1;

-- -- Who was Maisy Smith's first visit?
-- SELECT animals.name, vets.name, date_of_visit
-- FROM visits
-- JOIN animals ON animals.id = animals_id
-- JOIN vets ON vets.id = vets_id
-- WHERE vets.name = 'Maisy Smith'
-- ORDER BY date_of_visit LIMIT 1;

-- -- Details for most recent visit: animal information, vet information, and date of visit.
-- SELECT
--   animals.name,
--   animals.date_of_birth,
--   animals.escape_attempts,
--   animals.neutered,
--   animals.weight_kg,
--   vets.name,
--   vets.age,
--   vets.date_of_graduation,
--   visits.date_of_visit
-- FROM visits
-- JOIN animals ON animals_id = animals.id
-- JOIN vets ON vets_id = vets.id
-- ORDER BY date_of_visit DESC LIMIT 1;

-- -- How many visits were with a vet that did not specialize in that animal's species?
-- SELECT vets.name, COUNT(date_of_visit)
-- FROM vets
-- LEFT JOIN visits
-- ON vets.id = visits.vets_id
-- LEFT JOIN specializations
-- ON vets.id = specializations.vet_id
-- WHERE specializations.species_id IS NULL
-- GROUP BY vets.name;


-- -- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
-- SELECT species.name, COUNT(species.name)
-- FROM visits
-- JOIN animals ON animals_id = animals.id
-- JOIN vets ON vets_id = vets.id
-- JOIN species ON animals.species_id = species.id
-- WHERE vets.name = 'Maisy Smith'
-- GROUP BY species.name
-- ORDER BY COUNT(species.name) DESC LIMIT 1;


SELECT COUNT(*) FROM visits where animals_id = 4;
SELECT * FROM visits where vets_id = 2;
SELECT * FROM owners where email = 'owner_18327@mail.com';