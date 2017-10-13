DROP TABLE IF EXISTS adoptions;
DROP TABLE IF EXISTS pets;
DROP TABLE IF EXISTS owners;

CREATE TABLE pets(
id SERIAL4 PRIMARY KEY,
name VARCHAR(255),
type VARCHAR(255),
breed VARCHAR(255),
status VARCHAR(255),
admission_date DATE 
);

CREATE TABLE owners(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE adoptions(
  id SERIAL4 PRIMARY KEY,
  pet_id INT4 REFERENCES pets(id),
  owner_id INT4 REFERENCES owners(id)
);
