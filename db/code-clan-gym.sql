DROP TABLE members;

CREATE TABLE members(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  membership_type VARCHAR(255),
  date_of_birth VARCHAR(255)
);
