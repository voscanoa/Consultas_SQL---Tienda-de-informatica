-- Create a new database called 'TiendaInformatica'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT [name]
FROM sys.databases
WHERE [name] = N'TiendaInformatica'
)
CREATE DATABASE TiendaInformatica
GO

-- Create Table

CREATE TABLE fabricante
(
    id_fabricante INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto
(
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio MONEY NOT NULL,
    id_fabricante INT NOT NULL,
    FOREIGN KEY (id_fabricante) REFERENCES fabricante(id_fabricante)
);


