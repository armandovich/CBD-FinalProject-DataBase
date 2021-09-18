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

CREATE TABLE `fligth_types` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `description` varchar(255)
);

CREATE TABLE `fligth_schedules` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `day` varchar(255) UNIQUE NOT NULL
);

CREATE TABLE `fligths` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `fligth_number` varchar(255) UNIQUE NOT NULL,
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
  `fligth_type` int,
  `schedule_id` int NOT NULL
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

CREATE TABLE `passangers` (
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
  `passanger_id` int NOT NULL,
  `seats_type` int NOT NULL,
  `terminal_id` varchar(255) NOT NULL,
  `fligth_id` int NOT NULL,
  `airport_origin` int NOT NULL,
  `airport_destination` int NOT NULL,
  `bording_time` timestamp NOT NULL,
  `fligth_date` timestamp NOT NULL,
  `status_id` int NOT NULL
);

ALTER TABLE `airports` ADD FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

ALTER TABLE `airports` ADD FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`);

ALTER TABLE `airport_terminals` ADD FOREIGN KEY (`airporty_id`) REFERENCES `airports` (`id`);

ALTER TABLE `fligths` ADD FOREIGN KEY (`airline_id`) REFERENCES `airlines` (`id`);

ALTER TABLE `fligths` ADD FOREIGN KEY (`aircraft_id`) REFERENCES `aircrafts` (`id`);

ALTER TABLE `fligths` ADD FOREIGN KEY (`airport_origin`) REFERENCES `airports` (`id`);

ALTER TABLE `fligths` ADD FOREIGN KEY (`airport_destination`) REFERENCES `airports` (`id`);

ALTER TABLE `fligths` ADD FOREIGN KEY (`fligth_type`) REFERENCES `fligth_types` (`id`);

ALTER TABLE `fligths` ADD FOREIGN KEY (`schedule_id`) REFERENCES `fligth_schedules` (`id`);

ALTER TABLE `aircraft_models` ADD FOREIGN KEY (`aircraft_manufacture`) REFERENCES `aircraft_manufacturers` (`id`);

ALTER TABLE `aircrafts` ADD FOREIGN KEY (`aircraft_model`) REFERENCES `aircraft_models` (`id`);

ALTER TABLE `aircrafts` ADD FOREIGN KEY (`airline_id`) REFERENCES `airlines` (`id`);

ALTER TABLE `seats` ADD FOREIGN KEY (`aircraft_model`) REFERENCES `aircraft_models` (`id`);

ALTER TABLE `seats` ADD FOREIGN KEY (`seat_type`) REFERENCES `seat_types` (`id`);

ALTER TABLE `bookings` ADD FOREIGN KEY (`passanger_id`) REFERENCES `passangers` (`id`);

ALTER TABLE `bookings` ADD FOREIGN KEY (`fligth_id`) REFERENCES `fligths` (`id`);

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