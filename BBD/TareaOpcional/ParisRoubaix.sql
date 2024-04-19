-- Autor: Jordi Belda Calabuig 1° DAW SEMI
-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS ParisRoubaix;

-- Usar la base de datos
USE ParisRoubaix;            

  -- Tabla para los equipos
CREATE TABLE Equipos (
    EquipoID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Pais VARCHAR(50)
);


-- Tabla para los corredores
CREATE TABLE Ciclistas (
    CiclistaID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Nacionalidad VARCHAR(50),
    FechaNacimiento DATE,
    CONSTRAINT NombreUnico UNIQUE (Nombre)
);


-- Tabla para las ediciones de la carrera
CREATE TABLE Edicion (
    EdicionID INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE,
    DistanciaTotal DECIMAL(10 , 2 ),
    Pais VARCHAR(50),
    LugarInicio VARCHAR(100),
    LugarLlegada VARCHAR(100),
    Equipos INT,
    CiclistasParticipantes INT,
    CiclistasFinalizados INT,
    GanadorID INT,
    FOREIGN KEY (GanadorID)
        REFERENCES Ciclistas (CiclistaID)
);


-- Tabla para los resultados de cada edición
CREATE TABLE Resultados (
    ResultadoID INT AUTO_INCREMENT PRIMARY KEY,
    EdicionID INT,
  CiclistaID INT,
    Equipo INT,
    Posicion INT,
    Tiempo TIME,
    FOREIGN KEY (EdicionID)
        REFERENCES Edicion (EdicionID),
    FOREIGN KEY (CiclistaID)
        REFERENCES Ciclistas (CiclistaID),
    FOREIGN KEY (Equipo)
        REFERENCES Equipos (EquipoID)
);



###DATOS### 

-- Insertar datos de los equipos
INSERT INTO Equipos (Nombre, Pais) VALUES
('Alpecin-Deceuninck', 'BEL'),
('Alpecin-Fenix', 'BEL'),
('Arkéa-Samsic', 'FRA'),
('Bahrain Victorious', 'BRN'),
('Bora-Hansgrohe', 'GER'),
('Cofidis', 'FRA'),
('Deceuninck-Quick Step', 'BEL'),
('Delko Marseille Provence', 'FRA'),
('EF Education First', 'USA'),
('EF Education First', 'USA'),
('Groupama-FDJ', 'FRA'),
('Ineos Grenadiers', 'GBR'),
('Intermarché-Circus-Wanty', 'BEL'),
('Intermarché-Wanty-Gobert Matériaux', 'BEL'),
('Israel Start-Up Nation', 'ISR'),
('Jumbo-Visma', 'NED'),
('Katusha-Alpecin', 'RUS'),
('Lidl-Trek', 'USA'),
('Lotto-Soudal', 'BEL'),
('Quick-Step Alpha Vinyl', 'BEL'),
('Team DSM', 'GER'),
('Trek-Segafredo', 'USA'),
('UAE Team Emirates', 'UAE'),
('Uno-X Mobility', 'NOR');






-- Insertar datos de los corredores
INSERT INTO Ciclistas (Nombre, Nacionalidad, FechaNacimiento) VALUES
('Philippe Gilbert', 'BEL', '1982-07-05'),
('Nils Politt', 'GER', '1994-03-06'),
('Yves Lampaert', 'BEL', '1991-04-10'),
('Sep Vanmarcke', 'BEL', '1988-07-28'),
('Peter Sagan', 'SVK', '1990-01-26'),
('Florian Sénéchal', 'FRA', '1993-07-10'),
('Mike Teunissen', 'NED', '1992-08-25'),
('Zdeněk Štybar', 'CZE', '1985-12-11'),
('Evaldas Šiškevicius', 'LTU', '1988-09-30'),
('Sebastian Langeveld', 'NED', '1985-01-17'),
('Sonny Colbrelli', 'ITA', '1990-05-17'),
('Florian Vermeersch', 'BEL', '1997-01-26'),
('Mathieu van der Poel', 'NED', '1995-01-19'),
('Gianni Moscon', 'ITA', '1994-08-20'),
('Christophe Laporte', 'FRA', '1992-12-11'),
('Wout van Aert', 'BEL', '1994-09-15'),
('Tom Van Asbroeck', 'BEL', '1990-09-19'),
('Guillaume Boivin', 'CAN', '1989-05-25'),
('Heinrich Haussler', 'AUS', '1984-02-25'),
('Dylan van Baarle', 'NED', '1992-05-21'),
('Filippo Ganna', 'ITA', '1996-07-25'),
('John Degenkolb', 'GER', '1989-01-07'),
('Max Walscheid', 'GER', '1993-04-13'),
('Laurenz Rex', 'BEL', '1995-10-15'),
('Stefan Küng', 'SUI', '1993-11-16'),
('Tom Devriendt', 'BEL', '1991-10-29'),
('Matej Mohorič', 'SLO', '1994-10-19'),
('Adrien Petit', 'FRA', '1990-09-26'),
('Jasper Stuyven', 'BEL', '1992-04-17'),
('Laurent Pichon', 'FRA', '1987-07-19'),
('Jasper Philipsen', 'BEL', '1997-07-02'),
('Mads Pedersen', 'DEN', '1995-12-18'),
('Gianni Vermeersch', 'BEL', '1993-11-19'),
('Laurence Pithie', 'NZL', '1999-01-19'),
('Jordi Meeus', 'BEL', '1998-06-09'),
('Søren Wærenskjold', 'NOR', '1998-08-07'),
('Madis Mihkels', 'EST', '1996-07-06');





-- Insertar datos de las ediciones
INSERT INTO Edicion (Fecha, DistanciaTotal, Pais, LugarInicio, LugarLlegada, Equipos, CiclistasParticipantes, CiclistasFinalizados, GanadorID ) VALUES
('2019-04-14', 257.7, 'FRA', 'Compiègne', 'Roubaix', 25, 175, 100, 1),
('2021-10-03', 257.7, 'FRA', 'Compiègne', 'Roubaix', 25, 174, 94, 11),
('2022-04-17', 257.2, 'FRA', 'Compiègne', 'Roubaix', 25, 170, 107, 20),
('2023-04-09', 256.6, 'FRA', 'Compiègne', 'Roubaix', 25, 175, 135, 13),
('2024-04-07',259.7, 'FRA', 'Compiègne', 'Roubaix', 25, 175, 110,13);



-- Insertar datos de los resultados de la edición 2019
INSERT INTO Resultados (EdicionID, CiclistaID, Posicion, Tiempo, Equipo) VALUES
(1, 1, 1, '5:58:02', 7),
(1, 2, 2, '5:58:02', 17),
(1, 3, 3, '5:58:15', 7),
(1, 4, 4, '5:58:42', 9),
(1, 5, 5, '5:58:44', 5),
(1, 6, 6, '5:58:49', 7),
(1, 7, 7, '5:58:49', 16),
(1, 8, 8, '5:58:49', 7),
(1, 9, 9, '5:58:49', 8),
(1, 10, 10, '5:58:49', 9);

-- Insertar datos de los resultados de la edición 2021
INSERT INTO Resultados (EdicionID, CiclistaID, Posicion, Tiempo, Equipo) VALUES
(2, 11, 1, '6:01:57', 4),
(2, 12, 2, '6:02:57', 19),
(2, 13, 3, '6:02:57', 2),
(2, 14, 4, '6:02:57', 12),
(2, 3, 5, '6:03:13', 7),
(2, 15, 6, '6:03:13', 6),
(2, 16, 7, '6:03:13', 16),
(2, 17, 8, '6:03:13', 15),
(2, 18, 9, '6:03:13', 15),
(2, 19, 10, '6:03:13', 4);

-- Insertar datos de los resultados de la edición 2022
INSERT INTO Resultados (EdicionID, CiclistaID, Posicion, Tiempo, Equipo) VALUES
(3, 20, 1, '5:37:00', 12),
(3, 16, 2, '5:38:47', 16),
(3, 25, 3, '5:38:47', 11),
(3, 26, 4, '5:38:47', 13),
(3, 27, 5, '5:38:47', 4),
(3, 28, 6, '5:39:27', 14),
(3, 29, 7, '5:39:27', 22),
(3, 30, 8, '5:39:27', 3),
(3, 13, 9, '5:39:34', 2),
(3, 3, 10, '5:39:59', 20);

-- Insertar datos de los resultados de la edición 2023
INSERT INTO Resultados (EdicionID, CiclistaID, Posicion, Tiempo, Equipo) VALUES
(4, 13, 1, '5:28:41', 1),
(4, 31, 2, '5:29:27', 1),
(4, 16, 3, '5:29:27', 16),
(4, 32, 4, '5:29:31', 20),
(4, 25, 5, '5:29:31', 11),
(4, 33, 6, '5:29:31', 1),
(4, 21, 7, '5:31:16', 21),
(4, 23, 8, '5:32:12', 11),
(4, 24, 9, '5:32:16', 13),
(4, 15, 10, '5:32:52', 16);

-- Insertar datos de los resultados de la edición 2024
INSERT INTO Resultados (EdicionID, CiclistaID, Posicion, Tiempo, Equipo) VALUES
(5, 13, 1, '5:25:58', 1),
(5, 31, 2, '5:28:58', 1),
(5, 32, 3, '5:28:58', 22),
(5, 34, 4, '5:28:58', 23),
(5, 25, 5, '5:29:13', 11),
(5, 35, 6, '5:29:45', 1),
(5, 36, 7, '5:29:46', 24),
(5, 37, 8, '5:30:45', 23),
(5, 29, 9, '5:30:45', 24),
(5, 37, 10, '5:30:45', 14);

