CREATE DATABASE IF NOT EXISTS ex04_DDL;
USE ex04_DDL;

CREATE DATABASE DDL_ex04;
USE DDL_ex04;

CREATE TABLE departamentos(
	codigo int,
    nombre varchar(100),
    presupuesto int,
    PRIMARY KEY (codigo)
);

CREATE TABLE empleados(
	DNI varchar(8),
    nombre varchar(100),
    apellidos varchar(255),
    departamento int,
    PRIMARY KEY (DNI),
    FOREIGN KEY (departamento) REFERENCES departamentos (codigo)
    ON DELETE cascade
    ON UPDATE cascade
);