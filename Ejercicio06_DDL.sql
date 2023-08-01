CREATE DATABASE IF NOT EXISTS ex06_DDL;
USE ex06_DDL;

CREATE TABLE peliculas(
	codigo int,
    nombre varchar(100) unique,
    calificacion_edad int,
    PRIMARY KEY (codigo)
);

CREATE TABLE salas(
	codigo int,
    nombre varchar(100) unique,
    pelicula int,
    PRIMARY KEY (codigo),
    FOREIGN KEY (pelicula) REFERENCES peliculas (codigo)
    ON DELETE cascade
    ON UPDATE cascade
);