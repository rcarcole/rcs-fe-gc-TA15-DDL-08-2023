CREATE DATABASE IF NOT EXISTS ex01_DDL;
USE ex01_DDL;

CREATE TABLE Estacion (
    identificador INT PRIMARY KEY,
    latitud DECIMAL(9,6),
    longitud DECIMAL(9,6),
    altitud DECIMAL(5,2)
);

CREATE TABLE Muestra (
    IdentificadorEstacion INT,
    Fecha DATE,
    Temperatura_minima DECIMAL(5,2),
    Temperatura_maxima DECIMAL(5,2),
    Precipitaciones DECIMAL(5,2),
    Humedad_minima DECIMAL(5,2),
    Humedad_maxima DECIMAL(5,2),
    Velocidad_viento_minima DECIMAL(5,2),
    Velocidad_viento_maxima DECIMAL(5,2),
    FOREIGN KEY (IdentificadorEstacion) REFERENCES Estacion(identificador)
    ON DELETE cascade
    ON UPDATE cascade
);
