-- ================================================================
-- SCRIPT DE INSERCIÓN DE DATOS CONSOLIDADOS PARA EL ESQUEMA ACTUALIZADO
-- Descripción: Este script puebla las tablas con una combinación de
-- todos los datos de ejemplo proporcionados.
-- ================================================================

-- ===================================================
-- PASO 1: POBLAR LAS TABLAS DE CATÁLOGO
-- Estos valores son la base para los registros de empleados.
-- ===================================================

-- Insertar los puestos de trabajo disponibles
INSERT INTO positions (position_name) VALUES
('General Former'),
('Groundman'),
('Trimer'),
('Former');

-- Insertar las zonas horarias
INSERT INTO time_zones (name) VALUES
('America/New_York'),
('America/Mexico_City');

-- Insertar los posibles estados de un empleado
INSERT INTO employee_status (name) VALUES
('Active'),
('Inactive');


-- ===================================================
-- PASO 2: POBLAR LA TABLA 'person'
-- Se combinan todas las personas de ambos conjuntos de datos.
-- Los campos que no existen en los datos originales (como ssn) se dejan como NULL.
-- ===================================================

INSERT INTO person (first_name, middle_name, last_name, second_last_name, birth_date, phone, ssn, photo) VALUES
-- Personas provenientes del ESQUEMA ANTIGUO (ssn y photo son NULL)
('John', 'Michael', 'Doe', 'Smith', '1990-05-15', '1234567890', NULL, NULL),
('Jane', NULL, 'Smith', 'Johnson', '1985-08-22', '2345678901', NULL, NULL),
('Alice', 'Marie', 'Brown', NULL, '1978-12-10', '3456789012', NULL, NULL),
('Robert', NULL, 'Wilson', NULL, '1995-03-25', '4567890123', NULL, NULL),
('Emily', 'Grace', 'Davis', 'Taylor', '2000-07-30', '5678901234', NULL, NULL),
('Michael', 'James', 'Miller', NULL, '1982-11-05', '6789012345', NULL, NULL),
('Sophia', NULL, 'Moore', 'Anderson', '1998-09-12', '7890123456', NULL, NULL),
('Daniel', 'Patrick', 'Taylor', NULL, '1975-04-18', '8901234567', NULL, NULL),
('Olivia', 'Rose', 'Thomas', 'White', '1992-06-20', '9012345678', NULL, NULL),
('William', NULL, 'Jackson', NULL, '1989-02-14', '1122334455', NULL, NULL),
('Michael', 'Andrew', 'Johnson', NULL, '1992-07-30', '1122334456', NULL, NULL), -- Se ajustó teléfono para que sea único
('Jane', NULL, 'Smith', NULL, '1985-09-22', '1987654321', NULL, NULL),

-- Personas provenientes del ESQUEMA NUEVO ("Datos dummy")
('Jesus', 'Salvador', 'Cortes', 'Gutierrez', '1996-09-24', '3313277149', '1230', NULL),
('David', NULL, 'Reyes', NULL, '2004-09-22', '6149716963', '5555', NULL),
('Carlos', NULL, 'Chinchilla', NULL, '2000-05-16', '7868528175', '7777', NULL),
('Edwin', NULL, 'Rodriguez', NULL, '1995-10-20', '9372045558', '6666', NULL),
('Jose', 'Martin', 'Segura', 'Murillo', '1995-01-20', '3324911134', '9999', NULL),
('Samuel', NULL, 'Segura', 'Garcia', '1995-04-21', '3314611703', '4444', NULL),
('Daniel', NULL, 'Beltran', 'Roman', '1985-12-04', '3311976666', '8888', NULL),
('Jesus', NULL, 'De la torre', 'Valdez', '1985-01-09', '3312794875', '2222', NULL);


-- ===================================================
-- PASO 3: POBLAR LA TABLA 'employees'
-- Se asocian las personas del "nuevo esquema" con sus roles de empleado.
-- Se utilizan subconsultas para obtener los IDs de forma dinámica y segura.
-- Las personas del "esquema antiguo" no tienen rol de empleado en este ejemplo.
-- ===================================================

INSERT INTO employees (person_id, hire_date, position_id, time_zone_id, status_id) VALUES
(
    (SELECT person_id FROM person WHERE first_name = 'Jesus' AND last_name = 'Cortes'),
    '2025-09-02',
    (SELECT position_id FROM positions WHERE position_name = 'General Former'),
    (SELECT time_zone_id FROM time_zones WHERE name = 'America/New_York'),
    (SELECT status_id FROM employee_status WHERE name = 'Active')
),
(
    (SELECT person_id FROM person WHERE first_name = 'David' AND last_name = 'Reyes'),
    CURRENT_DATE,
    (SELECT position_id FROM positions WHERE position_name = 'Groundman'),
    (SELECT time_zone_id FROM time_zones WHERE name = 'America/New_York'),
    (SELECT status_id FROM employee_status WHERE name = 'Active')
),
(
    (SELECT person_id FROM person WHERE first_name = 'Carlos' AND last_name = 'Chinchilla'),
    CURRENT_DATE,
    (SELECT position_id FROM positions WHERE position_name = 'Trimer'),
    (SELECT time_zone_id FROM time_zones WHERE name = 'America/New_York'),
    (SELECT status_id FROM employee_status WHERE name = 'Active')
),
(
    (SELECT person_id FROM person WHERE first_name = 'Edwin' AND last_name = 'Rodriguez'),
    CURRENT_DATE,
    (SELECT position_id FROM positions WHERE position_name = 'Former'),
    (SELECT time_zone_id FROM time_zones WHERE name = 'America/New_York'),
    (SELECT status_id FROM employee_status WHERE name = 'Active')
),
(
    (SELECT person_id FROM person WHERE first_name = 'Jose' AND last_name = 'Segura'),
    CURRENT_DATE,
    (SELECT position_id FROM positions WHERE position_name = 'Groundman'),
    (SELECT time_zone_id FROM time_zones WHERE name = 'America/Mexico_City'),
    NULL -- Estado no definido como 'Active' en los ejemplos, se deja NULO
),
(
    (SELECT person_id FROM person WHERE first_name = 'Samuel' AND last_name = 'Segura'),
    CURRENT_DATE,
    (SELECT position_id FROM positions WHERE position_name = 'Trimer'),
    (SELECT time_zone_id FROM time_zones WHERE name = 'America/Mexico_City'),
    NULL -- Estado no definido como 'Active' en los ejemplos, se deja NULO
),
(
    (SELECT person_id FROM person WHERE first_name = 'Daniel' AND last_name = 'Beltran'),
    CURRENT_DATE,
    (SELECT position_id FROM positions WHERE position_name = 'Former'),
    (SELECT time_zone_id FROM time_zones WHERE name = 'America/Mexico_City'),
    NULL -- Estado no definido como 'Active' en los ejemplos, se deja NULO
),
(
    (SELECT person_id FROM person WHERE first_name = 'Jesus' AND last_name = 'De la torre'),
    CURRENT_DATE,
    (SELECT position_id FROM positions WHERE position_name = 'General Former'),
    (SELECT time_zone_id FROM time_zones WHERE name = 'America/Mexico_City'),
    NULL -- Estado no definido como 'Active' en los ejemplos, se deja NULO
);
