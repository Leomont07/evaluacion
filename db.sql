-- Crear base de datos
CREATE DATABASE IF NOT EXISTS Rent4you_DW;
USE Rent4you_DW;

-- Crear esquema
CREATE SCHEMA IF NOT EXISTS rent4you;

-- Tabla Dim_Sucursal
CREATE TABLE rent4you.dim_sucursal (
    ID_Sucursal VARCHAR(10) PRIMARY KEY,
    Nombre_Sucursal VARCHAR(50) NOT NULL,
    Ciudad VARCHAR(50) NOT NULL,
    Pais VARCHAR(50) NOT NULL,
    Gerente_Sucursal VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- Tabla Dim_Cliente
CREATE TABLE rent4you.dim_cliente (
    ID_Cliente VARCHAR(10) PRIMARY KEY,
    Nombre_Cliente VARCHAR(100) NOT NULL,
    Edad INT,
    Genero VARCHAR(20),
    Tipo_Licencia VARCHAR(20),
    Frecuencia_Alquiler INT
) ENGINE=InnoDB;

-- Tabla Dim_Vehículo
CREATE TABLE rent4you.dim_vehiculo (
    ID_Vehículo VARCHAR(10) PRIMARY KEY,
    Tipo_Vehículo VARCHAR(20) NOT NULL,
    Marca VARCHAR(50) NOT NULL,
    Modelo VARCHAR(50) NOT NULL,
    Costo_Seguro DECIMAL(10,2) NOT NULL
) ENGINE=InnoDB;

-- Tabla Dim_Empleado
CREATE TABLE rent4you.dim_empleado (
    ID_Empleado VARCHAR(10) PRIMARY KEY,
    Nombre_Empleado VARCHAR(100),
    Rol VARCHAR(50),
    Sucursal_Asignada VARCHAR(10),
    Antigüedad INT
) ENGINE=InnoDB;

-- Tabla Dim_Categoria_Gasto
CREATE TABLE rent4you.dim_categoria_gasto (
    ID_Categoria_Gasto VARCHAR(10) PRIMARY KEY,
    Nombre_Categoria VARCHAR(50)
) ENGINE=InnoDB;

-- Tabla Dim_Tiempo
CREATE TABLE rent4you.dim_tiempo (
    ID_Fecha VARCHAR(8) PRIMARY KEY,
    Dia INT,
    Mes INT,
    Año INT,
    Dia_Semana VARCHAR(10)
) ENGINE=InnoDB;

-- Tabla Fact_Ventas
CREATE TABLE rent4you.fact_ventas (
    ID_Alquiler VARCHAR(10) PRIMARY KEY,
    ID_Sucursal VARCHAR(10),
    ID_Cliente VARCHAR(10),
    ID_Vehículo VARCHAR(10),
    ID_Empleado VARCHAR(10),
    Fecha_Alquiler DATE,
    Duración_Alquiler_Dias INT,
    Monto_Alquiler DECIMAL(10,2),
    Descuento_Aplicado DECIMAL(10,2),
    Seguro_Contratado VARCHAR(3),
    FOREIGN KEY (ID_Sucursal) REFERENCES rent4you.dim_sucursal(ID_Sucursal),
    FOREIGN KEY (ID_Cliente) REFERENCES rent4you.dim_cliente(ID_Cliente),
    FOREIGN KEY (ID_Vehículo) REFERENCES rent