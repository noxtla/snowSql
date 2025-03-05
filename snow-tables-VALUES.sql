use snow;

INSERT INTO marital_status (description_marital_status) VALUES
('Single'),
('Married'),
('Divorced'),
('Widowed');

INSERT INTO birthplace (city, state, country) VALUES
('New York', 'New York', 'USA'),
('Los Angeles', 'California', 'USA'),
('Sydney', 'New South Wales', 'Australia'),
('Toronto', 'Ontario', 'Canada'),
('Mumbai', 'Maharashtra', 'India');


INSERT INTO gender (description_gender) VALUES
('Male'),
('Female'),
('Non-binary'),
('Other');

INSERT INTO person (first_name, middle_name, last_name, second_last_name, mobile_phone, birthplace_id_FK, gender_id_FK, marital_status_id_FK, birth_date) VALUES
('John', 'Michael', 'Doe', NULL, 1234567890, 1, 1, 1, '1990-05-15'),
('Jane', NULL, 'Smith', 'Johnson', 2345678901, 2, 2, 2, '1985-08-22'),
('Alice', 'Marie', 'Brown', NULL, 3456789012, 3, 2, 3, '1978-12-10'),
('Robert', NULL, 'Wilson', NULL, 4567890123, 1, 1, 2, '1995-03-25'),
('Emily', 'Grace', 'Davis', 'Taylor', 5678901234, 2, 2, 1, '2000-07-30'),
('Michael', 'James', 'Miller', NULL, 6789012345, 3, 1, 3, '1982-11-05'),
('Sophia', NULL, 'Moore', 'Anderson', 7890123456, 1, 2, 2, '1998-09-12'),
('Daniel', 'Patrick', 'Taylor', NULL, 8901234567, 2, 1, 3, '1975-04-18'),
('Olivia', 'Rose', 'Thomas', 'White', 9012345678, 3, 2, 1, '1992-06-20'),
('William', NULL, 'Jackson', NULL, 1122334455, 1, 1, 2, '1989-02-14');


-- Insertando datos en la tabla person
INSERT INTO person (first_name, middle_name, last_name, second_last_name, mobile_phone, birthplace_id_FK, gender_id_FK, marital_status_id_FK, birth_date)
VALUES 
('John', 'Michael', 'Doe', 'Smith', 1234567890, 1, 1, 2, '1990-05-15'),
('Jane', NULL, 'Smith', NULL, 1987654321, 2, 2, 1, '1985-09-22'),
('Michael', 'Andrew', 'Johnson', NULL, 1122334455, 3, 1, 3, '1992-07-30');

-- Insertando datos en la tabla ClientData con el mismo ID de person y solo memo
INSERT INTO ClientData (client_id, memo) 
VALUES 
(1, 'Regular tourist visa application'),
(2, 'Studying in the US, F1 visa'),
(3, 'Applying for H1B work visa');
