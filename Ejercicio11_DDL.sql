CREATE DATABASE IF NOT EXISTS ex11_DDL;
USE ex11_DDL;

CREATE TABLE Facultad (
    codigo INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Investigadores (
    dni VARCHAR(15) PRIMARY KEY,
    NomApels VARCHAR(255) NOT NULL,
    codigoFacultad INT,
    FOREIGN KEY (codigoFacultad) REFERENCES Facultad(codigo)
);

CREATE TABLE Equipos (
    numSerie INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    codigoFacultad INT NOT NULL,
    FOREIGN KEY (codigoFacultad) REFERENCES Facultad(codigo)
);

CREATE TABLE Reserva (
    dni VARCHAR(15),
    numSerie INT,
    comienzo DATETIME NOT NULL,
    fin DATETIME NOT NULL,
    PRIMARY KEY (dni, numSerie),
    FOREIGN KEY (dni) REFERENCES Investigadores(dni),
    FOREIGN KEY (numSerie) REFERENCES Equipos(numSerie)
);
