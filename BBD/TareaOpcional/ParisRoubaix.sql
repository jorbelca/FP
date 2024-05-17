##Autor: Jordi Belda Calabuig 1° DAW SEMI
-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS ParisRoubaix;

-- Usar la base de datos
USE ParisRoubaix; 

-- Tabla para los equipos
CREATE TABLE Equipo (
    EquipoID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Pais VARCHAR(50)
);

-- Tabla para los corredores
CREATE TABLE Ciclista (
    CiclistaID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Nacionalidad VARCHAR(50),
    FechaNacimiento DATE
);

-- Tabla para las ediciones de la carrera
CREATE TABLE Edicion (
    EdicionID INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE,
    DistanciaTotal DECIMAL(10 , 2 ),
    Pais VARCHAR(50),
    LugarInicio VARCHAR(100),
    LugarLlegada VARCHAR(100),
    CiclistasParticipantes INT,
    CiclistasFinalizados INT
);

-- Tabla para los resultados de cada edición
CREATE TABLE Resultados (
    EdicionID INT,
    CiclistaID INT,
    Posicion INT,
    Tiempo TIME,
    FOREIGN KEY (EdicionID)
        REFERENCES Edicion (EdicionID),
    FOREIGN KEY (CiclistaID)
        REFERENCES Ciclista (CiclistaID),
    PRIMARY KEY (EdicionID , CiclistaID)
);

-- Tabla para la relación N:M entre Equipos y Ciclistas
CREATE TABLE Ciclista_Equipo (
    CiclistaID INT,
    EquipoID INT,
    Anio INT,
    PRIMARY KEY (CiclistaID , EquipoID , Anio),
    FOREIGN KEY (CiclistaID)
        REFERENCES Ciclista (CiclistaID),
    FOREIGN KEY (EquipoID)
        REFERENCES Equipo (EquipoID)
)

;
##DATOS##

-- Insertar datos de los equipos
INSERT INTO Equipo (Nombre, Pais) VALUES
('Alpecin-Deceuninck', 'BEL'),
('Alpecin-Fenix', 'BEL'),
('Arkéa-Samsic', 'FRA'),
('Bahrain Victorious', 'BRN'),
('Bora-Hansgrohe', 'GER'),
('Cofidis', 'FRA'),
('Deceuninck-Quick Step', 'BEL'),
('Delko Marseille Provence', 'FRA'),
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
INSERT INTO Ciclista (Nombre, Nacionalidad, FechaNacimiento) VALUES
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
INSERT INTO Edicion (Fecha, DistanciaTotal, Pais, LugarInicio, LugarLlegada, CiclistasParticipantes, CiclistasFinalizados ) VALUES
('2019-04-14', 257.7, 'FRA', 'Compiègne', 'Roubaix',  175, 100 ),
('2021-10-03', 257.7, 'FRA', 'Compiègne', 'Roubaix',  174, 94 ),
('2022-04-17', 257.2, 'FRA', 'Compiègne', 'Roubaix',  170, 107),
('2023-04-09', 256.6, 'FRA', 'Compiègne', 'Roubaix',  175, 135),
('2024-04-07',259.7, 'FRA', 'Compiègne', 'Roubaix',  175, 110);


-- Insertar datos de los resultados de la edición 2019
INSERT INTO Resultados (EdicionID, CiclistaID, Posicion, Tiempo) VALUES
(1, 1, 1, '5:58:02'),
(1, 2, 2, '5:58:02'),
(1, 3, 3, '5:58:15'),
(1, 4, 4, '5:58:42'),
(1, 5, 5, '5:58:44'),
(1, 6, 6, '5:58:49'),
(1, 7, 7, '5:58:49'),
(1, 8, 8, '5:58:49'),
(1, 9, 9, '5:58:49'),
(1, 10, 10, '5:58:49');

-- Insertar datos de los resultados de la edición 2021
INSERT INTO Resultados (EdicionID, CiclistaID, Posicion, Tiempo) VALUES
(2, 11, 1, '6:01:57'),
(2, 12, 2, '6:02:57'),
(2, 13, 3, '6:02:57'),
(2, 14, 4, '6:02:57'),
(2, 3, 5, '6:03:13'),
(2, 15, 6, '6:03:13'),
(2, 16, 7, '6:03:13'),
(2, 17, 8, '6:03:13'),
(2, 18, 9, '6:03:13'),
(2, 19, 10, '6:03:13');

-- Insertar datos de los resultados de la edición 2022
INSERT INTO Resultados (EdicionID, CiclistaID, Posicion, Tiempo) VALUES
(3, 20, 1, '5:37:00'),
(3, 16, 2, '5:38:47'),
(3, 25, 3, '5:38:47'),
(3, 26, 4, '5:38:47'),
(3, 27, 5, '5:38:47'),
(3, 28, 6, '5:39:27'),
(3, 29, 7, '5:39:27'),
(3, 30, 8, '5:39:27'),
(3, 13, 9, '5:39:34'),
(3, 3, 10, '5:39:59');

-- Insertar datos de los resultados de la edición 2023
INSERT INTO Resultados (EdicionID, CiclistaID, Posicion, Tiempo) VALUES
(4, 13, 1, '5:28:41'),
(4, 31, 2, '5:29:27'),
(4, 16, 3, '5:29:27'),
(4, 32, 4, '5:29:31'),
(4, 25, 5, '5:29:31'),
(4, 33, 6, '5:29:31'),
(4, 21, 7, '5:31:16'),
(4, 23, 8, '5:32:12'),
(4, 24, 9, '5:32:16'),
(4, 15, 10, '5:32:52');

-- Insertar datos de los resultados de la edición 2024
INSERT INTO Resultados (EdicionID, CiclistaID, Posicion, Tiempo) VALUES
(5, 13, 1, '5:25:58'),
(5, 31, 2, '5:28:58'),
(5, 32, 3, '5:28:58'),
(5, 2, 4, '5:28:58'),
(5, 25, 5, '5:29:13'),
(5, 33, 6, '5:29:45'),
(5, 34, 7, '5:29:46'),
(5, 35, 8, '5:30:45'),
(5, 36, 9, '5:30:45'),
(5, 37, 10, '5:30:45');

-- Insertar datos en la tabla Ciclista_Equipo
INSERT INTO Ciclista_Equipo (EquipoID, CiclistaID, Anio) VALUES
(7, 1, 2019),
(16, 2, 2019),
(7, 3, 2019),
(9, 4, 2019),
(5, 5, 2019),
(7, 6, 2019),
(15, 7, 2019),
(7, 8, 2019),
(8, 9, 2019),
(9, 10, 2019),

(4, 11, 2021),
(18, 12, 2021),
(2, 13, 2021),
(11, 14, 2021),
(7, 3, 2021),
(6, 15, 2021),
(15, 16, 2021),
(14, 17, 2021),
(14, 18, 2021),
(4, 19, 2021),

(11, 20, 2022),
(15, 16, 2022),
(10, 25, 2022),
(12, 26, 2022),
(4, 27, 2022),
(13, 28, 2022),
(21, 29, 2022),
(3, 30, 2022),
(2, 13, 2022),
(19, 3, 2022),

(1, 13, 2023),
(1, 31, 2023),
(15, 16, 2023),
(19, 32, 2023),
(10, 25, 2023),
(1, 33, 2023),
(20, 21, 2023),
(10, 23, 2023),
(12, 24, 2023),
(15, 15, 2023),

(1, 13, 2024),
(1, 31, 2024),
(21, 32, 2024),
(22, 34, 2024),
(10, 25, 2024),
(1, 35, 2024),
(23, 36, 2024),
(22, 37, 2024),
(23, 29, 2024),
(13, 37, 2024);
