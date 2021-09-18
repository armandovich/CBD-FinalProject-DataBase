DROP DATABASE IF EXISTS `airlines_database`;

CREATE DATABASE `airlines_database`;

USE `airlines_database`;
CREATE TABLE `countries` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) UNIQUE NOT NULL,
  `ISO_code` varchar(255) UNIQUE NOT NULL
);

CREATE TABLE `cities` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) NOT NULL
);

CREATE TABLE `airports` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) UNIQUE NOT NULL,
  `country_id` int,
  `city_id` int
);

CREATE TABLE `airport_terminals` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `number` varchar(255) NOT NULL,
  `gate` varchar(255) NOT NULL,
  `airporty_id` int
);

CREATE TABLE `airlines` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `IATA_code` varchar(255) UNIQUE NOT NULL
);

CREATE TABLE `flight_types` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `description` varchar(255)
);

CREATE TABLE `flight_schedules` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `day` varchar(255) UNIQUE NOT NULL
);

CREATE TABLE `flights` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `flight_number` varchar(255) UNIQUE NOT NULL,
  `aircraft_id` int NOT NULL,
  `airline_id` int NOT NULL,
  `airport_origin` int NOT NULL,
  `airport_destination` int NOT NULL,
  `departure_time` timestamp NOT NULL,
  `arrival_time` timestamp NOT NULL,
  `fligth_duration` timestamp,
  `price` float NOT NULL,
  `refundable` boolean,
  `include_food` boolean,
  `flight_type` int,
  `fligtht_schedule` int NOT NULL
);

CREATE TABLE `aircraft_manufacturers` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) UNIQUE NOT NULL
);

CREATE TABLE `aircraft_models` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `aircraft_manufacture` int,
  `model` varchar(255) UNIQUE NOT NULL
);

CREATE TABLE `aircrafts` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `aircraft_model` int NOT NULL,
  `airline_id` int NOT NULL
);

CREATE TABLE `seat_types` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `description` varchar(255) NOT NULL
);

CREATE TABLE `seats` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `seats_amount` int NOT NULL,
  `seat_type` int NOT NULL,
  `aircraft_model` int NOT NULL
);

CREATE TABLE `passengers` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `passport` varchar(255) UNIQUE NOT NULL,
  `email` varchar(255),
  `phone_number` varchar(255) NOT NULL
);

CREATE TABLE `booking_status` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `description` varchar(255) NOT NULL
);

CREATE TABLE `bookings` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `passenger_id` int NOT NULL,
  `seats_type` int NOT NULL,
  `terminal_id` varchar(255) NOT NULL,
  `flight_id` int NOT NULL,
  `airport_origin` int NOT NULL,
  `airport_destination` int NOT NULL,
  `bording_time` timestamp NOT NULL,
  `fligth_date` timestamp NOT NULL,
  `status_id` int NOT NULL
);

ALTER TABLE `airports` ADD FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

ALTER TABLE `airports` ADD FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`);

ALTER TABLE `airport_terminals` ADD FOREIGN KEY (`airporty_id`) REFERENCES `airports` (`id`);

ALTER TABLE `flights` ADD FOREIGN KEY (`airline_id`) REFERENCES `airlines` (`id`);

ALTER TABLE `flights` ADD FOREIGN KEY (`aircraft_id`) REFERENCES `aircrafts` (`id`);

ALTER TABLE `flights` ADD FOREIGN KEY (`airport_origin`) REFERENCES `airports` (`id`);

ALTER TABLE `flights` ADD FOREIGN KEY (`airport_destination`) REFERENCES `airports` (`id`);

ALTER TABLE `flights` ADD FOREIGN KEY (`flight_type`) REFERENCES `flight_types` (`id`);

ALTER TABLE `flights` ADD FOREIGN KEY (`fligtht_schedule`) REFERENCES `flight_schedules` (`id`);

ALTER TABLE `aircraft_models` ADD FOREIGN KEY (`aircraft_manufacture`) REFERENCES `aircraft_manufacturers` (`id`);

ALTER TABLE `aircrafts` ADD FOREIGN KEY (`aircraft_model`) REFERENCES `aircraft_models` (`id`);

ALTER TABLE `aircrafts` ADD FOREIGN KEY (`airline_id`) REFERENCES `airlines` (`id`);

ALTER TABLE `seats` ADD FOREIGN KEY (`aircraft_model`) REFERENCES `aircraft_models` (`id`);

ALTER TABLE `seats` ADD FOREIGN KEY (`seat_type`) REFERENCES `seat_types` (`id`);

ALTER TABLE `bookings` ADD FOREIGN KEY (`passenger_id`) REFERENCES `passengers` (`id`);

ALTER TABLE `bookings` ADD FOREIGN KEY (`flight_id`) REFERENCES `flights` (`id`);

ALTER TABLE `bookings` ADD FOREIGN KEY (`airport_origin`) REFERENCES `airports` (`id`);

ALTER TABLE `bookings` ADD FOREIGN KEY (`airport_destination`) REFERENCES `airports` (`id`);

ALTER TABLE `bookings` ADD FOREIGN KEY (`status_id`) REFERENCES `booking_status` (`id`);

ALTER TABLE `bookings` ADD FOREIGN KEY (`seats_type`) REFERENCES `seat_types` (`id`);

ALTER TABLE `bookings` ADD FOREIGN KEY (`terminal_id`) REFERENCES `airport_terminals` (`id`);



/* ========================================== */
/* INSERT ENTRIES ON AIRLINES TABLE */
/* ========================================== */
INSERT INTO `airlines` (`name`,`IATA_code`) VALUES 
('American Airlines','AA'),
('CargoItalia','2G'),
('Continental Airlines','CO'),
('American Airlines','DL'),
('Northwest Airlines','NW'),
('Air Canada','AC'),
('United Airlines Cargo','UA'),
('Canadian Airlines Int´l','CP'),
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
INSERT INTO `aircraft_manufacturers` (`name`) VALUES 
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
INSERT INTO `aircraft_models` (`aircraft_manufacture`, `model`) VALUES 
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
INSERT INTO `aircrafts` (`airline_id`, `aircraft_model`) VALUES 
(1,1),(1,1),(1,2),(1,4),(1,4),
(2,1),(2,1),(2,1),(2,18),(2,1),
(4,20),(4,13),(4,13),(4,2),(4,13),
(5,3),(5,3),(5,4),(5,4),(5,11),
(8,1),(8,1),(8,12),(8,12),(8,15),
(18,1),(18,1),(18,8),(18,6),(18,6);


/* ========================================== */
/* INSERT ENTRIES ON COUNTRIES TABLE */
/* ========================================== */
INSERT INTO `countries` (`name`, `ISO_code`) VALUES 
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
INSERT INTO `cities` (`name`) VALUES 
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
INSERT INTO `airports` (`name`,`code`,`country_id`,`city_id`) VALUES 
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
/* INSERT ENTRIES ON FLIGTH_SCHEDULES TABLE */
/* ========================================== */
INSERT INTO `flight_schedules` (`day`) VALUES 
('Sunday'),
('Monday'),
('Tuesday'),
('Wednesday'),
('Thursday'),
('Friday'),
('Saturday');