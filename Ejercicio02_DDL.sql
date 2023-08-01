CREATE DATABASE IF NOT EXISTS ex02_DDL;
USE ex02_DDL;

CREATE TABLE Editorial (
  ClaveEditorial INT PRIMARY KEY,
  Nombre VARCHAR(255) NOT NULL,
  Direccion VARCHAR(255) NOT NULL,
  Telefono VARCHAR(255) NOT NULL
);

CREATE TABLE Libro (
  ClaveLibro INT PRIMARY KEY,
  titulo VARCHAR(255) NOT NULL,
  idioma VARCHAR(255) NOT NULL,
  formato VARCHAR(255) NOT NULL,
  claveEditorial INT,
  FOREIGN KEY (claveEditorial) REFERENCES Editorial(ClaveEditorial)
  ON DELETE cascade
  ON UPDATE cascade
);

CREATE TABLE Tema (
  ClaveTema INT PRIMARY KEY,
  Nombre VARCHAR(255) NOT NULL
);

CREATE TABLE Autor (
  ClaveAutor INT PRIMARY KEY,
  Nombre VARCHAR(255) NOT NULL
);

CREATE TABLE Ejemplar (
  ClaveEjemplar INT PRIMARY KEY,
  ClaveLibro INT,
  NumeroOrden INT NOT NULL,
  Edicion VARCHAR(255) NOT NULL,
  Ubicacion VARCHAR(255) NOT NULL,
  Categoria VARCHAR(255) NOT NULL,
  FOREIGN KEY (ClaveLibro) REFERENCES Libro(ClaveLibro)
  ON DELETE cascade
  ON UPDATE cascade
);

CREATE TABLE Socio (
  ClaveSocio INT PRIMARY KEY,
  Nombre VARCHAR(255) NOT NULL,
  Direccion VARCHAR(255) NOT NULL,
  Telefono VARCHAR(255) NOT NULL,
  Categoria VARCHAR(255) NOT NULL
);

CREATE TABLE Prestamo (
  ClaveSocio INT,
  ClaveEjemplar INT,
  NumeroOrden INT NOT NULL,
  Fecha_prestamo DATE NOT NULL,
  Fecha_evolucion DATE NOT NULL,
  Notas VARCHAR(255) NOT NULL,
  PRIMARY KEY (ClaveSocio, ClaveEjemplar),
  FOREIGN KEY (ClaveSocio) REFERENCES Socio(ClaveSocio)
  ON DELETE cascade
  ON UPDATE cascade,
  FOREIGN KEY (ClaveEjemplar) REFERENCES Ejemplar(ClaveEjemplar)
  ON DELETE cascade
  ON UPDATE cascade
);

CREATE TABLE Trata_sobre (
  ClaveLibro INT,
  ClaveTema INT,
  PRIMARY KEY (ClaveLibro, ClaveTema),
  FOREIGN KEY (ClaveLibro) REFERENCES Libro(ClaveLibro)
  ON DELETE cascade
  ON UPDATE cascade,
  FOREIGN KEY (ClaveTema) REFERENCES Tema(ClaveTema)
  ON DELETE cascade
  ON UPDATE cascade
);

CREATE TABLE Escrito_por (
  ClaveLibro INT,
  ClaveAutor INT,
  PRIMARY KEY (ClaveLibro, ClaveAutor),
  FOREIGN KEY (ClaveLibro) REFERENCES Libro(ClaveLibro)
  ON DELETE cascade
  ON UPDATE cascade,
  FOREIGN KEY (ClaveAutor) REFERENCES Autor(ClaveAutor)
  ON DELETE cascade
  ON UPDATE cascade
);
