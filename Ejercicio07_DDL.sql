CREATE DATABASE IF NOT EXISTS ex07_DDL;
USE ex07_DDL;

CREATE TABLE despachos(
	Numero int,
    Capacidad int,
    PRIMARY KEY (Numero)
);

CREATE TABLE directores(
	DNI varchar(8),
    NomApels nvarchar(255),
    DNIJefe varchar (8),
    Despacho int,
    PRIMARY KEY (DNI),
    FOREIGN KEY (DNIJefe) REFERENCES directores(DNI)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (Despacho) REFERENCES despachos(Numero)
    ON DELETE cascade
    ON UPDATE cascade
);