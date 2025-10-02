DROP DATABASE IF EXISTS RentCar;
CREATE DATABASE RentCar CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE RentCar;
CREATE TABLE Clientes (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(60) NOT NULL,
	apellidos VARCHAR(120) NOT NULL,
	telefono VARCHAR(20) NOT NULL,
	dni VARCHAR(16) UNIQUE NOT NULL,
	email VARCHAR(120) UNIQUE NOT NULL,
	fRegistro DATE NOT NULL DEFAULT (CURRENT_DATE));
CREATE TABLE Coches (
	id_coche INT AUTO_INCREMENT PRIMARY KEY,
	marca VARCHAR(40) NOT NULL,
	modelo VARCHAR(80) NOT NULL,
	matricula VARCHAR(15) UNIQUE NOT NULL,
	plazas TINYINT UNSIGNED NOT NULL CHECK (plazas BETWEEN 1 AND 9),
    precio_dia DECIMAL(10,2) NOT NULL CHECK (precio_dia >= 0));
CREATE TABLE Alquiler (
	pk_alquiler INT AUTO_INCREMENT PRIMARY KEY,
	fk_cliente INT NOT NULL,
    fk_coche INT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    descuento DECIMAL(10,2),
    precio_final DECIMAL(10,2) NOT NULL CHECK (precio_final >= 0),
    FOREIGN KEY (fk_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (fk_coche) REFERENCES Coches(id_coche));
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
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE Coches_backup (
	id_backup INT AUTO_INCREMENT PRIMARY KEY,
    operacion ENUM('I','U','D') NOT NULL,
	id_coche INT,
	marca VARCHAR(40),
	modelo VARCHAR(80),
	matricula VARCHAR(15),
	plazas TINYINT UNSIGNED,
    precio_dia DECIMAL(10,2),
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE Alquiler_backup (
	id_backup INT AUTO_INCREMENT PRIMARY KEY,
    operacion ENUM('I','U','D') NOT NULL,
	pk_alquiler INT,
	fk_cliente INT,
    fk_coche INT,
    created_at DATETIME,
	updated_at DATETIME,
    descuento DECIMAL(10,2),
    precio_final DECIMAL(10,2),
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP);
    
DROP TRIGGER IF EXISTS trg_clientes_ai;
DROP TRIGGER IF EXISTS trg_clientes_au;
DROP TRIGGER IF EXISTS trg_clientes_ad;
DROP TRIGGER IF EXISTS trg_coches_ai;
DROP TRIGGER IF EXISTS trg_coches_au;
DROP TRIGGER IF EXISTS trg_coches_ad;
DROP TRIGGER IF EXISTS trg_alquiler_ai;
DROP TRIGGER IF EXISTS trg_alquiler_au;
DROP TRIGGER IF EXISTS trg_alquiler_ad;
    
DELIMITER //

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

CREATE TRIGGER trg_alquiler_ai
AFTER INSERT ON Alquiler
FOR EACH ROW
BEGIN
  INSERT INTO Alquiler_backup
    (operacion, pk_alquiler, fk_cliente, fk_coche, created_at, updated_at, descuento, precio_final)
  VALUES
    ('I', NEW.pk_alquiler, NEW.fk_cliente, NEW.fk_coche, NEW.created_at, NEW.updated_at, NEW.descuento, NEW.precio_final);
END//

CREATE TRIGGER trg_alquiler_au
AFTER UPDATE ON Alquiler
FOR EACH ROW
BEGIN
  INSERT INTO Alquiler_backup
    (operacion, pk_alquiler, fk_cliente, fk_coche, created_at, updated_at, descuento, precio_final)
  VALUES
    ('U', NEW.pk_alquiler, NEW.fk_cliente, NEW.fk_coche, NEW.created_at, NEW.updated_at, NEW.descuento, NEW.precio_final);
END//

CREATE TRIGGER trg_alquiler_ad
AFTER DELETE ON Alquiler
FOR EACH ROW
BEGIN
  INSERT INTO Alquiler_backup
    (operacion, pk_alquiler, fk_cliente, fk_coche, created_at, updated_at, descuento, precio_final)
  VALUES
    ('D', OLD.pk_alquiler, OLD.fk_cliente, OLD.fk_coche, OLD.created_at, OLD.updated_at, OLD.descuento, OLD.precio_final);
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

-- ALQUILERES (sin fechas en este modelo; solo para probar triggers)
-- Nota: precio_final >= 0 por tu CHECK; descuento DECIMAL (si lo usas como importe descontado)
INSERT INTO Alquiler (fk_cliente, fk_coche, descuento, precio_final)
SELECT c.id_cliente, h.id_coche, 0.00, 106.50
FROM Clientes c, Coches h
WHERE c.dni = '11111111A' AND h.matricula = '1234-ABC';

INSERT INTO Alquiler (fk_cliente, fk_coche, descuento, precio_final)
SELECT c.id_cliente, h.id_coche, 10.00, 168.00
FROM Clientes c, Coches h
WHERE c.dni = '22222222B' AND h.matricula = '5678-DEF';

INSERT INTO Alquiler (fk_cliente, fk_coche, descuento, precio_final)
SELECT c.id_cliente, h.id_coche, 5.50, 142.25
FROM Clientes c, Coches h
WHERE c.dni = '33333333C' AND h.matricula = '9012-GHI';


/* =========================
   OPERACIONES PARA DISPARAR TRIGGERS
   ========================= */

-- UPDATE en Clientes (debe crear fila 'U' en Clientes_backup)
UPDATE Clientes
SET telefono = '600999888'
WHERE dni = '11111111A';

-- DELETE en Clientes (creará 'D' en backup)
-- Para poder borrar al cliente de '11111111A' sin violar FK, primero
-- borraremos su alquiler (si lo hay).
DELETE a FROM Alquiler a
JOIN Clientes c ON c.id_cliente = a.fk_cliente
WHERE c.dni = '11111111A';

DELETE FROM Clientes WHERE dni = '11111111A';

-- UPDATE en Coches (fila 'U' en Coches_backup)
UPDATE Coches
SET precio_dia = 49.99
WHERE matricula = '9012-GHI';

-- DELETE en Coches (creará 'D' en backup)
-- De nuevo, si hay alquiler relacionado, bórralo primero.
DELETE a FROM Alquiler a
JOIN Coches h ON h.id_coche = a.fk_coche
WHERE h.matricula = '5678-DEF';

DELETE FROM Coches WHERE matricula = '5678-DEF';

-- UPDATE en Alquiler (fila 'U' en Alquiler_backup)
UPDATE Alquiler
SET precio_final = 150.00, descuento = 0.00
LIMIT 1;

-- DELETE en Alquiler (fila 'D' en Alquiler_backup)
DELETE FROM Alquiler
ORDER BY pk_alquiler DESC
LIMIT 1;


/* =========================
   CONSULTAS DE VERIFICACIÓN
   ========================= */

-- Tablas principales (cómo quedaron)
SELECT * FROM Clientes ORDER BY id_cliente;
SELECT * FROM Coches ORDER BY id_coche;
SELECT * FROM Alquiler ORDER BY pk_alquiler;

-- Backups: deben reflejar I/U/D
SELECT * FROM Clientes_backup ORDER BY id_backup;
SELECT * FROM Coches_backup ORDER BY id_backup;
SELECT * FROM Alquiler_backup ORDER BY id_backup;


