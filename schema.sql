/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(250),
  date_of_birth date,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg DECIMAL,
  species VARCHAR(250)
);

-- Add a column species of type string

ALTER TABLE animals
ADD species VARCHAR(250);