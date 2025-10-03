/* =========================
   CREACIÓN DE BASE DE DATOS
   ========================= */

DROP DATABASE IF EXISTS RentCar;
CREATE DATABASE RentCar CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE RentCar;


/* =========================
   TABLAS PRINCIPALES
   ========================= */

CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    apellidos VARCHAR(120) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    dni VARCHAR(16) UNIQUE NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    fRegistro DATE NOT NULL DEFAULT (CURRENT_DATE)
);

CREATE TABLE Coches (
    id_coche INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(40) NOT NULL,
    modelo VARCHAR(80) NOT NULL,
    matricula VARCHAR(15) UNIQUE NOT NULL,
    plazas TINYINT UNSIGNED NOT NULL CHECK (plazas BETWEEN 1 AND 9),
    precio_dia DECIMAL(10,2) NOT NULL CHECK (precio_dia >= 0)
);

CREATE TABLE Alquiler (
    pk_alquiler INT AUTO_INCREMENT PRIMARY KEY,
    fk_cliente INT NOT NULL,
    fk_coche INT NOT NULL,
    fecha_inicio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_final DATETIME NOT NULL CHECK (fecha_final >= fecha_inicio),
    descuento DECIMAL(10,2) DEFAULT 0.00 CHECK (descuento >= 0),
    precio_final DECIMAL(10,2) NOT NULL CHECK (precio_final >= 0),
    FOREIGN KEY (fk_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (fk_coche) REFERENCES Coches(id_coche)
);


/* =========================
   TABLAS BACKUP
   ========================= */

CREATE TABLE Clientes_backup (
    id_backup INT AUTO_INCREMENT PRIMARY KEY,
    operacion ENUM('I','U','D') NOT NULL,
    id_cliente INT,
    nombre VARCHAR(60),
    apellidos VARCHAR(120),
    telefono VARCHAR(20),
    dni VARCHAR(16),
    email VARCHAR(120),
    fRegistro DATE,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Coches_backup (
    id_backup INT AUTO_INCREMENT PRIMARY KEY,
    operacion ENUM('I','U','D') NOT NULL,
    id_coche INT,
    marca VARCHAR(40),
    modelo VARCHAR(80),
    matricula VARCHAR(15),
    plazas TINYINT UNSIGNED,
    precio_dia DECIMAL(10,2),
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Alquiler_backup (
    id_backup INT AUTO_INCREMENT PRIMARY KEY,
    operacion ENUM('I','U','D') NOT NULL,
    pk_alquiler INT,
    fk_cliente INT,
    fk_coche INT,
    fecha_inicio DATETIME,
    fecha_final DATETIME,
    descuento DECIMAL(10,2),
    precio_final DECIMAL(10,2),
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);


/* =========================
   ELIMINACIÓN DE TRIGGERS EXISTENTES
   ========================= */

DROP TRIGGER IF EXISTS trg_clientes_ai;
DROP TRIGGER IF EXISTS trg_clientes_au;
DROP TRIGGER IF EXISTS trg_clientes_ad;

DROP TRIGGER IF EXISTS trg_coches_ai;
DROP TRIGGER IF EXISTS trg_coches_au;
DROP TRIGGER IF EXISTS trg_coches_ad;

DROP TRIGGER IF EXISTS trg_alquiler_ai;
DROP TRIGGER IF EXISTS trg_alquiler_au;
DROP TRIGGER IF EXISTS trg_alquiler_ad;


/* =========================
   TRIGGERS DE AUDITORÍA
   ========================= */

DELIMITER //

-- CLIENTES
CREATE TRIGGER trg_clientes_ai
AFTER INSERT ON Clientes
FOR EACH ROW
BEGIN
  INSERT INTO Clientes_backup
    (operacion, id_cliente, nombre, apellidos, telefono, dni, email, fRegistro)
  VALUES
    ('I', NEW.id_cliente, NEW.nombre, NEW.apellidos, NEW.telefono, NEW.dni, NEW.email, NEW.fRegistro);
END//

CREATE TRIGGER trg_clientes_au
AFTER UPDATE ON Clientes
FOR EACH ROW
BEGIN
  INSERT INTO Clientes_backup
    (operacion, id_cliente, nombre, apellidos, telefono, dni, email, fRegistro)
  VALUES
    ('U', NEW.id_cliente, NEW.nombre, NEW.apellidos, NEW.telefono, NEW.dni, NEW.email, NEW.fRegistro);
END//

CREATE TRIGGER trg_clientes_ad
AFTER DELETE ON Clientes
FOR EACH ROW
BEGIN
  INSERT INTO Clientes_backup
    (operacion, id_cliente, nombre, apellidos, telefono, dni, email, fRegistro)
  VALUES
    ('D', OLD.id_cliente, OLD.nombre, OLD.apellidos, OLD.telefono, OLD.dni, OLD.email, OLD.fRegistro);
END//


-- COCHES
CREATE TRIGGER trg_coches_ai
AFTER INSERT ON Coches
FOR EACH ROW
BEGIN
  INSERT INTO Coches_backup
    (operacion, id_coche, marca, modelo, matricula, plazas, precio_dia)
  VALUES
    ('I', NEW.id_coche, NEW.marca, NEW.modelo, NEW.matricula, NEW.plazas, NEW.precio_dia);
END//

CREATE TRIGGER trg_coches_au
AFTER UPDATE ON Coches
FOR EACH ROW
BEGIN
  INSERT INTO Coches_backup
    (operacion, id_coche, marca, modelo, matricula, plazas, precio_dia)
  VALUES
    ('U', NEW.id_coche, NEW.marca, NEW.modelo, NEW.matricula, NEW.plazas, NEW.precio_dia);
END//

CREATE TRIGGER trg_coches_ad
AFTER DELETE ON Coches
FOR EACH ROW
BEGIN
  INSERT INTO Coches_backup
    (operacion, id_coche, marca, modelo, matricula, plazas, precio_dia)
  VALUES
    ('D', OLD.id_coche, OLD.marca, OLD.modelo, OLD.matricula, OLD.plazas, OLD.precio_dia);
END//


-- ALQUILERES
CREATE TRIGGER trg_alquiler_ai
AFTER INSERT ON Alquiler
FOR EACH ROW
BEGIN
  INSERT INTO Alquiler_backup
    (operacion, pk_alquiler, fk_cliente, fk_coche, fecha_inicio, fecha_final, descuento, precio_final)
  VALUES
    ('I', NEW.pk_alquiler, NEW.fk_cliente, NEW.fk_coche, NEW.fecha_inicio, NEW.fecha_final, NEW.descuento, NEW.precio_final);
END//

CREATE TRIGGER trg_alquiler_au
AFTER UPDATE ON Alquiler
FOR EACH ROW
BEGIN
  INSERT INTO Alquiler_backup
    (operacion, pk_alquiler, fk_cliente, fk_coche, fecha_inicio, fecha_final, descuento, precio_final)
  VALUES
    ('U', NEW.pk_alquiler, NEW.fk_cliente, NEW.fk_coche, NEW.fecha_inicio, NEW.fecha_final, NEW.descuento, NEW.precio_final);
END//

CREATE TRIGGER trg_alquiler_ad
AFTER DELETE ON Alquiler
FOR EACH ROW
BEGIN
  INSERT INTO Alquiler_backup
    (operacion, pk_alquiler, fk_cliente, fk_coche, fecha_inicio, fecha_final, descuento, precio_final)
  VALUES
    ('D', OLD.pk_alquiler, OLD.fk_cliente, OLD.fk_coche, OLD.fecha_inicio, OLD.fecha_final, OLD.descuento, OLD.precio_final);
END//

DELIMITER ;

DELIMITER //

CREATE OR REPLACE FUNCTION calcular_precio_alquiler(p_pk_alquiler INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_precio_dia DECIMAL(10,2);
    DECLARE v_descuento DECIMAL(10,2);
    DECLARE v_dias INT;
    DECLARE v_base DECIMAL(10,2);
    DECLARE v_final DECIMAL(10,2);

    SELECT c.precio_dia,
           IFNULL(a.descuento, 0),
           TIMESTAMPDIFF(DAY, a.fecha_inicio, a.fecha_final) + 1
      INTO v_precio_dia, v_descuento, v_dias
      FROM Alquiler a
      JOIN Coches  c ON c.id_coche = a.fk_coche
     WHERE a.pk_alquiler = p_pk_alquiler;

    IF v_dias < 1 THEN
        SET v_dias = 1; -- salvaguarda, por si fechas iguales o desorden accidental
    END IF;

    SET v_base  = v_precio_dia * v_dias;
    SET v_final = v_base - v_descuento;

    IF v_final < 0 THEN
        SET v_final = 0;
    END IF;

    RETURN ROUND(v_final, 2);
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER trg_alquiler_bi_calc
BEFORE INSERT ON Alquiler
FOR EACH ROW
BEGIN
    IF NEW.fecha_final < NEW.fecha_inicio THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'fecha_final no puede ser anterior a fecha_inicio';
    END IF;

    IF NEW.descuento IS NULL THEN
        SET NEW.descuento = 0.00;
    END IF;

    IF NEW.descuento < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El descuento no puede ser negativo';
    END IF;

    -- Calcula precio con los valores que se van a insertar
    DECLARE v_precio_dia DECIMAL(10,2);
    DECLARE v_dias INT;
    DECLARE v_base DECIMAL(10,2);
    DECLARE v_final DECIMAL(10,2);

    SELECT precio_dia INTO v_precio_dia
    FROM Coches WHERE id_coche = NEW.fk_coche;

    SET v_dias = TIMESTAMPDIFF(DAY, NEW.fecha_inicio, NEW.fecha_final) + 1;
    IF v_dias < 1 THEN SET v_dias = 1; END IF;

    SET v_base  = v_precio_dia * v_dias;
    SET v_final = v_base - NEW.descuento;
    IF v_final < 0 THEN SET v_final = 0; END IF;

    SET NEW.precio_final = ROUND(v_final, 2);
END//

CREATE TRIGGER trg_alquiler_bu_calc
BEFORE UPDATE ON Alquiler
FOR EACH ROW
BEGIN
    IF NEW.fecha_final < NEW.fecha_inicio THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'fecha_final no puede ser anterior a fecha_inicio';
    END IF;

    IF NEW.descuento IS NULL THEN
        SET NEW.descuento = 0.00;
    END IF;

    IF NEW.descuento < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El descuento no puede ser negativo';
    END IF;

    -- Recalcula precio ante cambios de fechas/coche/descuento
    DECLARE v_precio_dia DECIMAL(10,2);
    DECLARE v_dias INT;
    DECLARE v_base DECIMAL(10,2);
    DECLARE v_final DECIMAL(10,2);

    SELECT precio_dia INTO v_precio_dia
    FROM Coches WHERE id_coche = NEW.fk_coche;

    SET v_dias = TIMESTAMPDIFF(DAY, NEW.fecha_inicio, NEW.fecha_final) + 1;
    IF v_dias < 1 THEN SET v_dias = 1; END IF;

    SET v_base  = v_precio_dia * v_dias;
    SET v_final = v_base - NEW.descuento;
    IF v_final < 0 THEN SET v_final = 0; END IF;

    SET NEW.precio_final = ROUND(v_final, 2);
END//

DELIMITER ;



/* =========================
   DATOS DE EJEMPLO
   ========================= */

-- CLIENTES
INSERT INTO Clientes (nombre, apellidos, telefono, dni, email)
VALUES 
('Ana','Pérez Gómez','600111222','11111111A','ana@example.com'),
('Luis','García López','600222333','22222222B','luis@example.com'),
('Marta','Santos Ruiz','600333444','33333333C','marta@example.com'),
('Carlos','Nieves Díaz','600444555','44444444D','carlos@example.com'),
('Lucía','Martín Vega','600555666','55555555E','lucia@example.com');

-- COCHES
INSERT INTO Coches (marca, modelo, matricula, plazas, precio_dia)
VALUES
('Toyota','Yaris','1234-ABC',5,35.50),
('Peugeot','308','5678-DEF',5,42.00),
('Volkswagen','Golf','9012-GHI',5,48.75),
('Renault','Clio','3456-JKL',5,33.00),
('Fiat','500','7890-MNO',4,29.90),
('Seat','Leon','2468-PQR',5,45.00);

-- ALQUILERES (con fechas para que el trigger calcule precio_final)

-- Ana (Yaris): 3 días, sin descuento
INSERT INTO Alquiler (fk_cliente, fk_coche, fecha_inicio, fecha_final, descuento)
SELECT c.id_cliente, h.id_coche, '2025-10-05 10:00:00', '2025-10-07 18:00:00', 0.00
FROM Clientes c, Coches h
WHERE c.dni = '11111111A' AND h.matricula = '1234-ABC';

-- Luis (308): 4 días, 10€ descuento
INSERT INTO Alquiler (fk_cliente, fk_coche, fecha_inicio, fecha_final, descuento)
SELECT c.id_cliente, h.id_coche, '2025-10-10 09:00:00', '2025-10-13 20:00:00', 10.00
FROM Clientes c, Coches h
WHERE c.dni = '22222222B' AND h.matricula = '5678-DEF';

-- Marta (Golf): 3 días, 5.50€ descuento
INSERT INTO Alquiler (fk_cliente, fk_coche, fecha_inicio, fecha_final, descuento)
SELECT c.id_cliente, h.id_coche, '2025-11-01 08:00:00', '2025-11-03 19:00:00', 5.50
FROM Clientes c, Coches h
WHERE c.dni = '33333333C' AND h.matricula = '9012-GHI';



/* =========================
   OPERACIONES DE PRUEBA
   ========================= */

-- UPDATE en Clientes
UPDATE Clientes
SET telefono = '600999888'
WHERE dni = '11111111A';

-- DELETE en Clientes
DELETE a FROM Alquiler a
JOIN Clientes c ON c.id_cliente = a.fk_cliente
WHERE c.dni = '11111111A';
DELETE FROM Clientes WHERE dni = '11111111A';

-- UPDATE en Coches
UPDATE Coches
SET precio_dia = 49.99
WHERE matricula = '9012-GHI';

-- DELETE en Coches
DELETE a FROM Alquiler a
JOIN Coches h ON h.id_coche = a.fk_coche
WHERE h.matricula = '5678-DEF';
DELETE FROM Coches WHERE matricula = '5678-DEF';

-- UPDATE en Alquiler
UPDATE Alquiler
SET precio_final = 150.00, descuento = 0.00
LIMIT 1;

-- DELETE en Alquiler
DELETE FROM Alquiler
ORDER BY pk_alquiler DESC
LIMIT 1;


/* =========================
   CONSULTAS DE VERIFICACIÓN
   ========================= */

-- Tablas principales
SELECT * FROM Clientes ORDER BY id_cliente;
SELECT * FROM Coches ORDER BY id_coche;
SELECT * FROM Alquiler ORDER BY pk_alquiler;

-- Tablas backup
SELECT * FROM Clientes_backup ORDER BY id_backup;
SELECT * FROM Coches_backup ORDER BY id_backup;
SELECT * FROM Alquiler_backup ORDER BY id_backup;


