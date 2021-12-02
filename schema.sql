/* Database schema to keep the structure of entire database. */

DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS species;
DROP TABLE IF EXISTS vets;
DROP TABLE IF EXISTS specializations;

-- create a table named vets
CREATE TABLE vets (
  id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(250),
  age INT,
  date_of_graduation date
);

-- create a table named owners
CREATE TABLE owners (
  id SERIAL NOT NULL PRIMARY KEY,
  full_name VARCHAR(250),
  age INT
);

-- create a table named species
CREATE TABLE species (
  id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(250)
);

CREATE TABLE animals (
  id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(250),
  date_of_birth date,
  escape_attempts INT,
  neutered BOOLEAN,

  
  weight_kg DECIMAL,
  species_id INT,
  owner_id INT,
  CONSTRAINT fk_species
    FOREIGN KEY(species_id)
      REFERENCES species(id),
  CONSTRAINT fk_owners
    FOREIGN KEY(owner_id)
      REFERENCES owners(id)
);

-- create a join table named specializations
CREATE TABLE specializations (
  species_id INT,
  vet_id INT,
  CONSTRAINT fk_species
    FOREIGN KEY(species_id)
      REFERENCES species(id),
  CONSTRAINT fk_vets
    FOREIGN KEY(vet_id)
      REFERENCES vets(id)
);

-- create a join table named visits
CREATE TABLE visits (
  animals_id INT,
  vets_id INT,
  date_of_visit date,
  CONSTRAINT fk_animals
    FOREIGN KEY(animals_id)
      REFERENCES animals(id),
  CONSTRAINT fk_vets
    FOREIGN KEY(vets_id)
      REFERENCES vets(id)
);
