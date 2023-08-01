CREATE DATABASE IF NOT EXISTS ex12_DDL;
USE ex12_DDL;

CREATE TABLE Profesores (
    dni VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50) NOT NULL,
    direccion VARCHAR(255),
    titulo VARCHAR(100),
    gana FLOAT NOT NULL,
    UNIQUE (nombre, apellido, apellido2)
);

CREATE TABLE Cursos (
    cod_curso INT PRIMARY KEY,
    nombre_curso VARCHAR(100) NOT NULL UNIQUE,
    dni_profesor VARCHAR(15) NOT NULL,
    maximo_alumnos INT,
    fecha_inicio DATE,
    fecha_fin DATE CHECK (fecha_fin > fecha_inicio),
    num_horas INT NOT NULL,
    FOREIGN KEY (dni_profesor) REFERENCES Profesores(dni)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE Alumnos (
    dni VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50) NOT NULL,
    direccion VARCHAR(255),
    sexo CHAR(1) CHECK (sexo IN ('M', 'H')),
    fecha_nacimiento DATE,
    cod_curso INT NOT NULL,
    FOREIGN KEY (cod_curso) REFERENCES Cursos(cod_curso)
    ON DELETE cascade
    ON UPDATE cascade
);
