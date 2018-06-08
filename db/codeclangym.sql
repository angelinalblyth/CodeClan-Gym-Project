DROP TABLE members;
DROP TABLE gym_classes;

CREATE TABLE members(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  membership_type VARCHAR(255),
  date_of_birth VARCHAR(255)
);

CREATE TABLE gym_classes(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  description TEXT,
  teacher VARCHAR(255),
  cost INT4,
  duration INT2
);
