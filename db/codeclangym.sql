DROP TABLE bookings;
DROP TABLE members;
DROP TABLE gym_classes;


CREATE TABLE members(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  membership_type VARCHAR(255)
);

CREATE TABLE gym_classes(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  description TEXT,
  teacher VARCHAR(255),
  cost INT4,
  duration INT2,
  class_time VARCHAR(255),
  capacity INT2
);

CREATE TABLE bookings(
  id SERIAL8 PRIMARY KEY,
  member_id INT8 references members(id) ON DELETE CASCADE,
  gym_class_id INT8 references gym_classes(id) ON DELETE CASCADE
);
