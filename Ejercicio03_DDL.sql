CREATE DATABASE IF NOT EXISTS ex03_DDL;
USE ex03_DDL;

CREATE TABLE fabricantes(
	codigo int,
    nombre varchar(100),
    PRIMARY KEY (codigo)
);

CREATE TABLE articulos(
	codigo int,
    nombre varchar(100),
    precio int,
    fabricante int,
    PRIMARY KEY (codigo),
    FOREIGN KEY (fabricante) REFERENCES fabricantes (codigo)
    ON DELETE cascade
    ON UPDATE cascade
);