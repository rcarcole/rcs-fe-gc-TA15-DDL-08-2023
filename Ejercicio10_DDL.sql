CREATE DATABASE IF NOT EXISTS ex10_DDL;
USE ex10_DDL;

CREATE TABLE cajeros(
	codigo int,
    nom_apels varchar(225),
    PRIMARY KEY (codigo)
);

CREATE TABLE productos(
	codigo int,
    nombre varchar(100),
    precio int,
    PRIMARY KEY (codigo)
);

CREATE TABLE maquinas_registradas(
	codigo int,
    piso int,
    PRIMARY KEY (codigo)
);

CREATE TABLE ventas(
	cajero int,
    maquina int,
    producto int,
    PRIMARY KEY (cajero, maquina, producto),
    FOREIGN KEY (cajero) REFERENCES cajeros (codigo)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (producto) REFERENCES productos (codigo)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (maquina) REFERENCES maquinas_registradas (codigo)
    ON DELETE cascade
    ON UPDATE cascade
);