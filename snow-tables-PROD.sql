create database snow;
use snow;
drop database snow;

CREATE TABLE marital_status (
    id_marital_status INT AUTO_INCREMENT PRIMARY KEY,
    description_marital_status VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE birthplace (
    id_birthplace INT AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(255),
    state VARCHAR(255),
    country VARCHAR(255) NOT NULL,
    CONSTRAINT unique_birthplace UNIQUE (city, state, country)
);

CREATE TABLE gender (
    id_gender INT AUTO_INCREMENT PRIMARY KEY,
    description_gender VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE person (
    id_person INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255),
    last_name VARCHAR(255) NOT NULL,
    second_last_name VARCHAR(255),
    mobile_phone BIGINT NOT NULL UNIQUE,
    birthplace_id_FK INT,
    gender_id_FK INT,
    marital_status_id_FK INT,
    birth_date DATE NOT NULL,
    FOREIGN KEY (birthplace_id_FK) REFERENCES birthplace(id_birthplace) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (gender_id_FK) REFERENCES gender(id_gender) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (marital_status_id_FK) REFERENCES marital_status(id_marital_status) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE ClientData (
    client_id INT PRIMARY KEY,
    passport_number VARCHAR(50),
    email VARCHAR(255),
    has_used_other_names BOOLEAN NOT NULL,
    other_nationality VARCHAR(255),
    us_social_security_number VARCHAR(50),
    taxpayer_id VARCHAR(50),
    visa_type VARCHAR(50),
    passport_photo BLOB,  
    memo TEXT,
    FOREIGN KEY (client_id) REFERENCES person(id_person) ON DELETE CASCADE ON UPDATE CASCADE
);