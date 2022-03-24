CREATE TABLE `Facilities` (
  `id` bigint unsigned PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `latitude` float,
  `longitude` float,
  `operating_start_time_24hr` varchar(255),
  `operating_end_time_24hr` varchar(255),
  `landline_no` varchar(255),
  `email` varchar(255)
);

CREATE TABLE `Equipment` (
  `id` bigint unsigned PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `facility_id` bigint unsigned
);

CREATE TABLE `Doctors` (
  `id` bigint unsigned PRIMARY KEY AUTO_INCREMENT,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `landline_no` varchar(255),
  `email` varchar(255)
);

CREATE TABLE `Doctors_Specialization` (
  `id` bigint unsigned PRIMARY KEY AUTO_INCREMENT,
  `doctor_id` bigint unsigned,
  `doc_spec` bigint unsigned
);

CREATE TABLE `Specializations` (
  `id` bigint unsigned PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(255)
);

CREATE TABLE `Doctors_Facilities` (
  `id` bigint unsigned PRIMARY KEY AUTO_INCREMENT,
  `day` enum,
  `time_start_24hr` varchar(255),
  `time_end_24hr` varchar(255),
  `doctor_id` bigint unsigned,
  `facility_id` bigint unsigned,
  `room_no` varchar(255)
);

CREATE TABLE `Appointments` (
  `id` bigint unsigned PRIMARY KEY AUTO_INCREMENT,
  `appointment_start` timestamp,
  `appointment_end` timestamp,
  `doc_fac_id` bigint unsigned,
  `user_id` bigint unsigned
);

ALTER TABLE `Equipment` ADD FOREIGN KEY (`facility_id`) REFERENCES `Facilities` (`id`);

ALTER TABLE `Doctors_Specialization` ADD FOREIGN KEY (`doctor_id`) REFERENCES `Doctors` (`id`);

ALTER TABLE `Doctors_Specialization` ADD FOREIGN KEY (`doc_spec`) REFERENCES `Specializations` (`id`);

ALTER TABLE `Doctors_Facilities` ADD FOREIGN KEY (`doctor_id`) REFERENCES `Doctors` (`id`);

ALTER TABLE `Doctors_Facilities` ADD FOREIGN KEY (`facility_id`) REFERENCES `Facilities` (`id`);

ALTER TABLE `Appointments` ADD FOREIGN KEY (`doc_fac_id`) REFERENCES `Doctors_Facilities` (`id`);
