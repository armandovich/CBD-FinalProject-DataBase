DROP DATABASE IF EXISTS airlines_database;

CREATE DATABASE airlines_database;

USE airlines_database;

CREATE TABLE airlines (
  id int NOT NULL AUTO_INCREMENT,
  nane varchar(100),
  PRIMARY KEY (id)
);

CREATE TABLE aircrafts (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(100),
  seats int,
  airline_id int,
  PRIMARY KEY (id),
  FOREIGN KEY (airline_id) REFERENCES airlines(id)
);

CREATE TABLE countries (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(255),
  code varchar(10),
  PRIMARY KEY (id)
);

CREATE TABLE cities (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(255),
  PRIMARY KEY (id)
);

CREATE TABLE airports (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(255),
  code varchar(10),
  city_id int,
  country_id int,
  PRIMARY KEY (id),
  FOREIGN KEY (city_id) REFERENCES cities(id),
  FOREIGN KEY (country_id) REFERENCES countries(id)
);

CREATE TABLE fligths (
  id int NOT NULL AUTO_INCREMENT,
  number varchar(6),
  airline_id int,
  aircraft_id int,
  airport_origin int,
  airport_destination int,
  departure_time TIMESTAMP,
  arrival_time TIMESTAMP,
  price float,
  refundable boolean,
  include_food boolean,
  scheedule varchar(25),
  PRIMARY KEY (id)
);

CREATE TABLE passangers (
  id int NOT NULL AUTO_INCREMENT,
  first_name varchar(255),
  last_name varchar(255),
  passport varchar(25),
  PRIMARY KEY (id)
);

CREATE TABLE booking_status (
  id int NOT NULL AUTO_INCREMENT,
  description varchar(50),
  PRIMARY KEY (id)
);

CREATE TABLE bookings (
  id int NOT NULL AUTO_INCREMENT,
  passanger_id int,
  fligth_id int,
  airport_origin int,
  airport_destination int,
  status_id int,
  creation_date timestamp,
  PRIMARY KEY (id),
  FOREIGN KEY (passanger_id) REFERENCES passangers(id),
  FOREIGN KEY (fligth_id) REFERENCES fligths(id),
  FOREIGN KEY (airport_origin) REFERENCES airports(id),
  FOREIGN KEY (airport_destination) REFERENCES airports(id),
  FOREIGN KEY (status_id) REFERENCES booking_status(id)
);