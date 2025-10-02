# 📦 RentCar - Base de Datos MySQL

Este proyecto define la base de datos **RentCar** en **MySQL 8+**, pensada para la gestión de una empresa de alquiler de coches.

Incluye:

- Tablas principales: **Clientes**, **Coches** y **Alquiler**.
- Integridad referencial con claves foráneas.
- Restricciones de negocio (`UNIQUE`, `CHECK`).
- Tablas de **backup/auditoría** que almacenan automáticamente cualquier **INSERT, UPDATE, DELETE** mediante **triggers**.

---

## 📑 Esquema de la Base de Datos

### Tabla `Clientes`
Información de los clientes.

| Columna     | Tipo        | Restricciones                     |
|-------------|------------|-----------------------------------|
| id_cliente  | INT        | PK, AUTO_INCREMENT                |
| nombre      | VARCHAR(60)| NOT NULL                          |
| apellidos   | VARCHAR(120)| NOT NULL                         |
| telefono    | VARCHAR(20)| NOT NULL                          |
| dni         | VARCHAR(16)| NOT NULL, UNIQUE                  |
| email       | VARCHAR(120)| NOT NULL, UNIQUE                 |
| fRegistro   | DATE       | NOT NULL, DEFAULT CURRENT_DATE    |

---

### Tabla `Coches`
Información de la flota de vehículos.

| Columna     | Tipo           | Restricciones                           |
|-------------|---------------|-----------------------------------------|
| id_coche    | INT           | PK, AUTO_INCREMENT                      |
| marca       | VARCHAR(40)   | NOT NULL                                |
| modelo      | VARCHAR(80)   | NOT NULL                                |
| matricula   | VARCHAR(15)   | NOT NULL, UNIQUE                        |
| plazas      | TINYINT       | NOT NULL, CHECK (1–9)                   |
| precio_dia  | DECIMAL(10,2) | NOT NULL, CHECK (>= 0)                  |

---

### Tabla `Alquiler`
Registra los alquileres de coches realizados por clientes.

| Columna      | Tipo           | Restricciones                                      |
|--------------|---------------|----------------------------------------------------|
| pk_alquiler  | INT           | PK, AUTO_INCREMENT                                 |
| fk_cliente   | INT           | FK → `Clientes.id_cliente`                         |
| fk_coche     | INT           | FK → `Coches.id_coche`                             |
| created_at   | DATETIME      | DEFAULT CURRENT_TIMESTAMP                          |
| updated_at   | DATETIME      | DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP |
| descuento    | DECIMAL(10,2) | Valor absoluto del descuento aplicado              |
| precio_final | DECIMAL(10,2) | NOT NULL, CHECK (>= 0)                             |

---

## 🗄️ Tablas de Backup (Auditoría)

Estas tablas almacenan un **histórico** de todas las operaciones (I/U/D) gracias a los triggers definidos.

- `Clientes_backup`
- `Coches_backup`
- `Alquiler_backup`

Cada una incluye:
- `id_backup` (PK)
- `operacion` (`I`, `U`, `D`)
- Copia de los campos relevantes de la tabla principal
- `fecha` (timestamp de la operación)

---

## ⚙️ Triggers

Se han definido **9 triggers** (3 por tabla principal):

- `trg_clientes_ai` → después de INSERT en `Clientes`.
- `trg_clientes_au` → después de UPDATE en `Clientes`.
- `trg_clientes_ad` → después de DELETE en `Clientes`.

- `trg_coches_ai` → después de INSERT en `Coches`.
- `trg_coches_au` → después de UPDATE en `Coches`.
- `trg_coches_ad` → después de DELETE en `Coches`.

- `trg_alquiler_ai` → después de INSERT en `Alquiler`.
- `trg_alquiler_au` → después de UPDATE en `Alquiler`.
- `trg_alquiler_ad` → después de DELETE en `Alquiler`.

Cada trigger inserta en la tabla `_backup` correspondiente una fila con:

- Tipo de operación (`I`, `U`, `D`).
- Valores afectados (`NEW` u `OLD`).
- Fecha del cambio.

---

## 🧪 Poblar la Base de Datos

Ejemplo de inserción de datos:

```sql
-- Clientes
INSERT INTO Clientes (nombre, apellidos, telefono, dni, email)
VALUES
('Ana','Pérez Gómez','600111222','11111111A','ana@example.com'),
('Luis','García López','600222333','22222222B','luis@example.com');

-- Coches
INSERT INTO Coches (marca, modelo, matricula, plazas, precio_dia)
VALUES
('Toyota','Yaris','1234-ABC',5,35.50),
('Peugeot','308','5678-DEF',5,42.00);

-- Alquiler
INSERT INTO Alquiler (fk_cliente, fk_coche, descuento, precio_final)
VALUES (1, 1, 0.00, 106.50),
       (2, 2, 5.00, 168.00);
