DROP DATABASE IF EXISTS airlines_database;

CREATE DATABASE airlines_database;

USE airlines_database;
CREATE TABLE countries (
  id int PRIMARY KEY AUTO_INCREMENT,
  name varchar(255) UNIQUE NOT NULL,
  ISO_code varchar(3) UNIQUE NOT NULL
);

CREATE TABLE cities (
  id int PRIMARY KEY AUTO_INCREMENT,
  name varchar(255) UNIQUE NOT NULL
);

CREATE TABLE airports (
  id int PRIMARY KEY AUTO_INCREMENT,
  name varchar(255) UNIQUE NOT NULL,
  IATA_code varchar(3) UNIQUE NOT NULL,
  country_id int,
  city_id int
);

CREATE TABLE airlines (
  id int PRIMARY KEY AUTO_INCREMENT,
  name varchar(255) UNIQUE NOT NULL,
  IATA_code varchar(3) UNIQUE NOT NULL
);

CREATE TABLE flight_types (
  id int PRIMARY KEY AUTO_INCREMENT,
  description varchar(25) UNIQUE NOT NULL
);

CREATE TABLE flight_schedules (
  id int PRIMARY KEY AUTO_INCREMENT,
  day varchar(10) UNIQUE NOT NULL
);

CREATE TABLE flights (
  id int PRIMARY KEY AUTO_INCREMENT,
  flight_number varchar(255) UNIQUE NOT NULL,
  aircraft_id int NOT NULL,
  airline_id int NOT NULL,
  airport_origin int NOT NULL,
  airport_destination int NOT NULL,
  departure_time time NOT NULL,
  arrival_time time NOT NULL,
  flight_duration time,
  price float NOT NULL,
  refundable boolean,
  include_food boolean,
  flight_type int,
  flight_schedule int NOT NULL
);

CREATE TABLE aircraft_manufacturers (
  id int PRIMARY KEY AUTO_INCREMENT,
  name varchar(255) UNIQUE NOT NULL
);

CREATE TABLE aircraft_models (
  id int PRIMARY KEY AUTO_INCREMENT,
  aircraft_manufacture int,
  model varchar(255) NOT NULL
);

CREATE TABLE aircrafts (
  id int PRIMARY KEY AUTO_INCREMENT,
  aircraft_model int NOT NULL,
  airline_id int NOT NULL
);

CREATE TABLE seat_types (
  id int PRIMARY KEY AUTO_INCREMENT,
  description varchar(11) UNIQUE NOT NULL
);

CREATE TABLE seats (
  id int PRIMARY KEY AUTO_INCREMENT,
  seats_amount int NOT NULL,
  seat_type int NOT NULL,
  aircraft_model int NOT NULL
);

CREATE TABLE passengers (
  id int PRIMARY KEY AUTO_INCREMENT,
  first_name varchar(100) NOT NULL,
  last_name varchar(100) NOT NULL,
  passport varchar(25) UNIQUE NOT NULL,
  email varchar(255) UNIQUE,
  phone_number varchar(25) NOT NULL
);

CREATE TABLE booking_status (
  id int PRIMARY KEY AUTO_INCREMENT,
  description varchar(10) NOT NULL
);

CREATE TABLE bookings (
  id int PRIMARY KEY AUTO_INCREMENT,
  passenger_id int NOT NULL,
  seat_type int NOT NULL,
  flight_id int NOT NULL,
  airport_origin int NOT NULL,
  airport_destination int NOT NULL,
  bording_time time NOT NULL,
  flight_date timestamp NOT NULL,
  status_id int NOT NULL
);

ALTER TABLE airports ADD FOREIGN KEY (country_id) REFERENCES countries (id);

ALTER TABLE airports ADD FOREIGN KEY (city_id) REFERENCES cities (id);

ALTER TABLE flights ADD FOREIGN KEY (airline_id) REFERENCES airlines (id);

ALTER TABLE flights ADD FOREIGN KEY (aircraft_id) REFERENCES aircrafts (id);

ALTER TABLE flights ADD FOREIGN KEY (airport_origin) REFERENCES airports (id);

ALTER TABLE flights ADD FOREIGN KEY (airport_destination) REFERENCES airports (id);

ALTER TABLE flights ADD FOREIGN KEY (flight_type) REFERENCES flight_types (id);

ALTER TABLE flights ADD FOREIGN KEY (flight_schedule) REFERENCES flight_schedules (id);

ALTER TABLE aircraft_models ADD FOREIGN KEY (aircraft_manufacture) REFERENCES aircraft_manufacturers (id);

ALTER TABLE aircrafts ADD FOREIGN KEY (aircraft_model) REFERENCES aircraft_models (id);

ALTER TABLE aircrafts ADD FOREIGN KEY (airline_id) REFERENCES airlines (id);

ALTER TABLE seats ADD FOREIGN KEY (aircraft_model) REFERENCES aircraft_models (id);

ALTER TABLE seats ADD FOREIGN KEY (seat_type) REFERENCES seat_types (id);

ALTER TABLE bookings ADD FOREIGN KEY (passenger_id) REFERENCES passengers (id);

ALTER TABLE bookings ADD FOREIGN KEY (flight_id) REFERENCES flights (id);

ALTER TABLE bookings ADD FOREIGN KEY (airport_origin) REFERENCES airports (id);

ALTER TABLE bookings ADD FOREIGN KEY (airport_destination) REFERENCES airports (id);

ALTER TABLE bookings ADD FOREIGN KEY (status_id) REFERENCES booking_status (id);

ALTER TABLE bookings ADD FOREIGN KEY (seat_type) REFERENCES seat_types (id);

/* ========================================== */
/* INSERT ENTRIES ON AIRLINES TABLE */
/* ========================================== */
INSERT INTO airlines (name,IATA_code) VALUES 
('American Airlines','AA'),
('CargoItalia','2G'),
('Continental Airlines','CO'),
('Delta Air Lines','DL'),
('Northwest Airlines','NW'),
('Air Canada','AC'),
('United Airlines Cargo','UA'),
('Canadian Airlines','CP'),
('Fedex','FX'),
('Alaska Airlines','AS'),
('VARIG Brazilian Airlines','RG'),
('LAN Chile','LA'),
('Aer Lingus Cargo','EL'),
('Alitalia','AZ'),
('Air France','AF'),
('Indian Airlines','IC'),
('Cielos Airlines','A2'),
('Ukraine Int´l Airlines','PS'),
('Air Moldova','9U'),
('Biman Bangladesh','BG'),
('Air China','CA');

/* ========================================== */
/* INSERT ENTRIES ON AIRCRAFT MANUFACTURERS TABLE */
/* ========================================== */
INSERT INTO aircraft_manufacturers (name) VALUES 
('Airbus'),
('Antonov'),
('ATR Aircraft'),
('Boeing'),
('Bombardier Aerospace'),
('Comac'),
('Embraer'),
('Mitsubishi Aircraft Corporation');

/* ========================================== */
/* INSERT ENTRIES ON AIRCRAFT MODELS TABLE */
/* ========================================== */
INSERT INTO aircraft_models (aircraft_manufacture, model) VALUES 
(1,'A321'),
(1,'A330'),
(1,'A340'),
(1,'A350'),
(2,'An-148'),
(2,'An-24'),
(2,'An-140'),
(2,'An-28'),
(2,'An-10'),
(3,'42'),
(3,'72'),
(4,'737'),
(4,'747'),
(4,'767'),
(4,'777'),
(4,'787'),
(5,'415'),
(5,'CRJ 1000'),
(5,'CRJ 200'),
(5,'CRJ 550'),
(5,'CRJ 700'),
(6,'ARJ-21'),
(6,'C919');

/* ========================================== */
/* INSERT ENTRIES ON AIRCRAFT TABLE */
/* ========================================== */
INSERT INTO aircrafts (airline_id, aircraft_model) VALUES 
(1,1),
(1,1),
(1,2),
(1,4),
(1,4),
(2,1),
(2,1),
(2,1),
(2,18),
(2,1),
(4,20),
(4,13),
(4,13),
(4,2),
(4,13),
(5,3),
(5,3),
(5,4),
(5,4),
(5,11),
(8,1),
(8,1),
(8,12),
(8,12),
(8,15),
(18,1),
(18,1),
(18,8),
(18,6),
(18,6);

/* ========================================== */
/* INSERT ENTRIES ON COUNTRIES TABLE */
/* ========================================== */
INSERT INTO countries (name, ISO_code) VALUES 
('Canada','CAN'),
('Cuba','CUB'),
('Dominican Republic','DOM'),
('France','FRA'),
('Germany','DEU'),
('India','IND'),
('Italy','ITA'),
('Japan','JPN'),
('Spain','ESP'),
('Ukraine','UKR'),
('United States of America','USA');

/* ========================================== */
/* INSERT ENTRIES ON CITIES TABLE */
/* ========================================== */
INSERT INTO cities (name) VALUES 
('Toronto'),
('Havana'),
('Santo Domingo'),
('Punta Cana'),
('París'),
('Berlín'),
('Mumbai'),
('Delhi'),
('Florencia'),
('Roma'),
('Madrid'),
('Tokio'),
('Kiev'),
('Miami');

/* ========================================== */
/* INSERT ENTRIES ON AIRPORTS TABLE */
/* ========================================== */
INSERT INTO airports (name,IATA_code,country_id,city_id) VALUES 
('Billy Bishop Toronto City Airport','YTZ',1,1),
('José Martí International Airport','HAV',2,2),
('Aeropuerto Internacional de Las Américas','SDQ',3,3),
('Aeropuerto Internacional de Punta Cana','PUJ',3,4),
('Paris Charles de Gaulle Airport','CDG',4,5),
('Berlin Schönefeld Airport','SXF',5,6),
('Chhatrapati Shivaji Maharaj International Airport','BOM',6,7),
('Indira Gandhi International Airport','DEL',6,8),
('Florence Airport','FLR',7,9),
('Rome Ciampino Giovan Battista Pastine Airport','CIA',7,10),
('Madrid-Barajas Adolfo Suárez Airport','MAD',8,11),
('Narita International Airport','NRT',9,12),
('Kyiv Boryspil International Airport','KBP',10,13),
('Miami International Airport','MIA',11,14);

/* ========================================== */
/* INSERT ENTRIES ON FLIGHT_SCHEDULES TABLE */
/* ========================================== */
INSERT INTO flight_schedules (day) VALUES 
('Sunday'),
('Monday'),
('Tuesday'),
('Wednesday'),
('Thursday'),
('Friday'),
('Saturday');

/* ========================================== */
/* INSERT ENTRIES ON SEAT_TYPES TABLE */
/* ========================================== */
INSERT INTO seat_types (description) VALUES
('Economy'),
('Premium'),
('Business'),
('First-Class');

/* ========================================== */
/* INSERT ENTRIES ON SEATS TABLE */
/* ========================================== */
INSERT INTO seats (seats_amount, seat_type, aircraft_model) VALUES
(150, 1, 1),
(180, 1, 2),
(200, 1, 3),
(50, 1, 4),
(180, 1, 5),
(80, 1, 6),
(90, 1, 7),
(70, 1, 8),
(50, 1, 9),
(50, 1, 10),
(250, 1, 11),
(240, 1, 12),
(140, 1, 13),
(250, 1, 14),
(100, 1, 15),
(110, 1, 16),
(90, 1, 17),
(100, 1, 18),
(190, 1, 19),
(220, 2, 20),
(50, 2, 21),
(50, 2, 22),
(70, 2, 23);


/* ========================================== */
/* INSERT ENTRIES ON FLIGHT_TYPES TABLE */
/* ========================================== */
INSERT INTO flight_types (description) VALUES
('Domestic'),
('International');

/* ========================================== */
/* INSERT ENTRIES ON PASSENGERS TABLE */
/* ========================================== */
INSERT INTO passengers (first_name, last_name, passport, email, phone_number) VALUES
('Simranjit', 'Singh', 'T0437188', 'Simranjit.contact@gmail.com', '7696161979'),
('Daniel', 'Miolan', 'I0894659', 'Miolan98@gmail.com', '8097952129'),
('Pawan', 'Kumar', 'V0654155', 'Pawan55@gmail.com', '4379854051'),
('Amritpal', 'Singh', 'W0465135', 'Amrit45@gmail.com', '7837564789'),
('Taylor', 'Swift', 'T0786999', 'Taylor13@gmail.com', '7696131313'),
('Joe', 'Alwyn', 'W0645132', 'Hannah98@gmail.com', '7894641525'),
('Selena', 'Gomez', 'X0786999', 'Selena89@gmail.com', '1876495873'),
('Hannah', 'Montana', 'U0895697', 'Hannah90@gmail.com', '1578648913'),
('Emily', 'Osment', 'G0457961', 'Emily46@gmail.com', '1979865152'),
('Jason', 'Earles', 'S0648794', 'Jason_earles@gmail.com', '7974646465'),
('Miley', 'Cyrus', 'H0487156', 'Miley_1992@gmail.com', '7846531136'),
('Jack', 'Harlow', 'J0578645', 'Jack_h98@gmail.com', '7453645134'),
('Quenlin', 'Blackwell', 'T0487219', 'Quen_black786@gmail.com', '5254681535'),
('Rudy', 'Mustang', 'H0784692', 'Rudy.mustang@gmail.com', '8465134634'),
('Danny', 'Gonzalez', 'K0189731', 'Danny_gonz@gmail.com', '8451313464'),
('Drew', 'Gooden', 'L0463161', 'Drew_texas@gmail.com', '6465416319'),
('Michael', 'Reeves', 'G0956238', 'Michael_reeee@gmail.com', '5415364889'),
('William', 'Osman', 'W0653285', 'William.biz@gmail.com', '8453215688'),
('Lily', 'Pichu', 'S0451325','Lilly_art@gmail.com', '9846514682'),
('Manpreet', 'Singh', 'A0645154', 'Manpreetsingh258@gmail.com', '8745125468'),
('Amanpreet', 'Singh', 'Z0596564', 'Singhamanpreet96@gmail.com', '7846513468'),
('Rahul', 'Kumar', 'N0465312', 'Rahul54@gmail.com', '5412548564'),
('Yvonne', 'Nigel', 'M0456132', 'Yvonne1998@gmail.com', '5725486464'),
('Jake', 'Ryan', 'R0846518', 'Jake_ny@gmail.com', '8641495655'),
('Alex', 'Apollonov', 'X0794687', 'Alex_australia@gmail.com', '6476546135');

INSERT INTO booking_status (description) VALUES 
('Inprogress'),
('Complete'),
('Cancel');

INSERT INTO flights (flight_number, aircraft_id, airline_id, airport_origin, airport_destination, departure_time,arrival_time,flight_duration,price,refundable,include_food,flight_type,flight_schedule) VALUES
('CA001',23,8,3,1,'09:00:00','13:00:00','04:00:00',720,false,false,2,1),
('CA002',23,8,3,1,'09:00:00','13:00:00','04:00:00',720,false,false,2,2),
('CA003',23,8,3,1,'09:00:00','13:00:00','04:00:00',720,false,false,2,3),
('CA004',23,8,3,1,'09:00:00','13:00:00','04:00:00',720,false,false,2,4),
('CA005',23,8,3,1,'09:00:00','13:00:00','04:00:00',720,false,false,2,5),
('CA006',23,8,3,1,'09:00:00','13:00:00','04:00:00',720,false,false,2,6),
('CA007',23,8,3,1,'09:00:00','13:00:00','04:00:00',720,false,false,2,7),
('CU001',1,1,3,2,'10:00:00','11:00:00','01:00:00',200,true,false,2,2),
('CU002',1,1,3,2,'10:00:00','11:00:00','01:00:00',200,true,false,2,4),
('CU003',1,1,3,2,'10:00:00','11:00:00','01:00:00',200,true,false,2,6),
('CA201',24,8,2,1,'12:00:00','15:00:00','03:00:00',300,false,false,2,2),
('CA202',25,8,2,1,'12:00:00','15:00:00','03:00:00',300,false,false,2,4),
('CA203',25,8,2,1,'12:00:00','15:00:00','03:00:00',300,false,false,2,6),
('UK001',28,18,4,13,'10:00:00','18:00:00','08:00:00',950,false,true,2,1),
('UK002',28,18,4,13,'10:00:00','18:00:00','08:00:00',950,false,true,2,2),
('UK003',28,18,4,13,'10:00:00','18:00:00','08:00:00',950,false,true,2,3),
('UK004',28,18,4,13,'10:00:00','18:00:00','08:00:00',950,false,true,2,4),
('UK005',28,18,4,13,'10:00:00','18:00:00','08:00:00',950,false,true,2,5),
('UK006',28,18,4,13,'10:00:00','18:00:00','08:00:00',950,false,true,2,6),
('UK007',28,18,4,13,'10:00:00','18:00:00','08:00:00',950,false,true,2,7),
('UR001',29,18,13,4,'13:00:00','22:00:00','08:00:00',950,false,true,2,1),
('UR002',29,18,13,4,'13:00:00','22:00:00','08:00:00',950,false,true,2,2),
('UR003',29,18,13,4,'13:00:00','22:00:00','08:00:00',950,false,true,2,3),
('UR004',29,18,13,4,'13:00:00','22:00:00','08:00:00',950,false,true,2,4),
('UR005',29,18,13,4,'13:00:00','22:00:00','08:00:00',950,false,true,2,5),
('UR006',29,18,13,4,'13:00:00','22:00:00','08:00:00',950,false,true,2,6),
('UR007',29,18,13,4,'13:00:00','22:00:00','08:00:00',950,false,true,2,7);

INSERT INTO bookings (passenger_id, seat_type, flight_id, airport_origin, airport_destination, bording_time, flight_date, status_id) VALUES
(1,4,7,3,1,'8:30:00','2018-01-20',2),
(20,1,10,3,2,'8:30:00','2020-10-02',2),
(21,1,8,3,2,'8:30:00','2002-03-11',2),
(22,1,6,3,1,'8:30:00','2007-03-23',2),
(23,1,9,3,2,'8:30:00','2010-01-20',2),
(10,1,9,3,2,'8:30:00','2010-01-20',2),
(2,4,16,4,13,'09:00:00','2010-01-12',2),
(3,4,16,4,13,'09:00:00','2010-01-12',2),
(4,1,17,4,13,'09:00:00','2010-01-13',2),
(5,2,18,4,13,'09:00:00','2010-01-14',2),
(2,4,22,13,4,'12:00:00','2010-03-01',2),
(2,1,1,3,1,'08:30:00','2011-01-16',2),
(24,1,9,3,2,'8:30:00','2018-08-08',2);

/* ========================================== */
/* VISUALIZATION FOR AIRLINES AND AIRCRAFT */
/* ========================================== */
SELECT plane.id, CONCAT(manufacturer.name,' ',model.model), airline.id, airline.name 
FROM aircrafts as plane 
LEFT JOIN aircraft_models as model 
ON plane.aircraft_model = model.id 
LEFT JOIN aircraft_manufacturers as manufacturer
ON model.aircraft_manufacture = manufacturer.id
LEFT JOIN airlines as airline
ON plane.airline_id = airline.id;

/* ========================================== */
/* VISUALIZATION FOR AIRPORTS */
/* ========================================== */
SELECT airport.id, CONCAT(airport.name,' - ',airport.IATA_code), country.name, city.name
FROM airports as airport 
LEFT JOIN countries as country
ON airport.country_id = country.id
LEFT JOIN cities as city
ON airport.city_id = city.id;

/* ========================================== */
/* FIND FLIGTH VALUES FOR A SPESIFIC DATE */
/* ========================================== */
SELECT id, flight_number, airport_origin, airport_destination 
FROM flights 
WHERE flight_schedule = DAYOFWEEK('2007-03-23');

/* ========================================== */
/* FIND BOOKINGS FROM THE LAST MONTH AND GIVEN DATE */
/* ========================================== */
SELECT * FROM bookings 
WHERE YEAR(flight_date) = YEAR('2021-02-28') 
AND MONTH(flight_date) = MONTH('2021-02-28' - INTERVAL 1 MONTH)