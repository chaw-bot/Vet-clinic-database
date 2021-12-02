/* Database schema to keep the structure of entire database. */

DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS species;

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
