-- DROP DATABASE Farmacia_VitalCare;

CREATE DATABASE IF NOT EXISTS Farmacia_VitalCare;

 CREATE TABLE IF NOT EXISTS Farmacia_VitalCare.Categorias (
	Id_categoria INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Nombre VARCHAR(100) NOT NULL
 );
 
CREATE TABLE IF NOT EXISTS Farmacia_VitalCare.Medicamentos(
	Id_medicamento INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Nombre VARCHAR(100) NOT NULL,
	Fecha_Vencimiento DATE NOT NULL,
	Precio DOUBLE,
	Stock INT,
    Id_categoria INT,
	FOREIGN KEY (Id_categoria) REFERENCES Categorias(Id_categoria)
);

 CREATE TABLE IF NOT EXISTS Farmacia_VitalCare.Presentaciones(
	Id_presentacion INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Tipo_presentacion VARCHAR(50) NOT NULL
 );

CREATE TABLE IF NOT EXISTS Farmacia_VitalCare.Dosis (
    Id_dosis INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Cantidad VARCHAR(50) NOT NULL 
);

CREATE TABLE IF NOT EXISTS Farmacia_VitalCare.Laboratorios(
	Id_laboratorio INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Nombre VARCHAR(100) NOT NULL,
	Direccion VARCHAR(250),
	Telefono VARCHAR(15) NOT NULL,
	Mail VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Farmacia_VitalCare.Empleados (
    Id_empleado INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Telefono VARCHAR(15) NOT NULL,
    Puesto VARCHAR(100),  
    Salario DOUBLE
);
CREATE TABLE IF NOT EXISTS Farmacia_VitalCare.FormasPago (
    Id_forma_pago INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Descripcion VARCHAR(100) NOT NULL
);

 CREATE TABLE IF NOT EXISTS Farmacia_VitalCare.Pedidos (
	Id_pedido INT AUTO_INCREMENT PRIMARY KEY NOT NULL, 
    fecha DATE, 
    Estado_pedido VARCHAR(50),
	Id_forma_pago INT, 
	Observaciones TEXT,
    Id_laboratorio INT,
    Id_empleado  INT,
	FOREIGN KEY (Id_forma_pago) REFERENCES FormasPago(Id_forma_pago),
    FOREIGN KEY (Id_laboratorio) REFERENCES Laboratorios(Id_laboratorio),
    FOREIGN KEY (Id_empleado) REFERENCES Empleados(Id_empleado)
);

CREATE TABLE IF NOT EXISTS Farmacia_VitalCare.Clientes(
	Id_cliente INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
	Direccion VARCHAR(250),
	Telefono VARCHAR(15) NOT NULL,
	Mail VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Farmacia_VitalCare.Ventas(
	Id_venta INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Id_cliente INT,
    Id_empleado  INT,
    Importe_total DOUBLE,
    FOREIGN KEY (Id_cliente) REFERENCES Clientes(Id_cliente),
	FOREIGN KEY (Id_empleado) REFERENCES Empleados(Id_empleado)
);

-- Tablas intermedias
CREATE TABLE IF NOT EXISTS Farmacia_VitalCare.Medicamentos_Laboratorios(
	Id_laboratorio INT,
	Id_medicamento INT,
    FOREIGN KEY (Id_medicamento) REFERENCES Medicamentos(Id_medicamento),
    FOREIGN KEY (Id_laboratorio) REFERENCES Laboratorios(Id_laboratorio),
    PRIMARY KEY (Id_medicamento, Id_laboratorio)
 );

 CREATE TABLE IF NOT EXISTS Farmacia_VitalCare.Medicamentos_Presentaciones (
    Id_medicamento INT,
    Id_presentacion INT,
    FOREIGN KEY (Id_medicamento) REFERENCES Medicamentos(Id_medicamento),
    FOREIGN KEY (Id_presentacion) REFERENCES Presentaciones(Id_presentacion),
    PRIMARY KEY (Id_medicamento, Id_presentacion)
);

CREATE TABLE IF NOT EXISTS Farmacia_VitalCare.Medicamentos_Dosis (
    Id_medicamento INT,
    Id_dosis INT,
    FOREIGN KEY (Id_medicamento) REFERENCES Medicamentos(Id_medicamento),
    FOREIGN KEY (Id_dosis) REFERENCES Dosis(Id_dosis),
    PRIMARY KEY (Id_medicamento, Id_dosis)
);

CREATE TABLE IF NOT EXISTS Farmacia_VitalCare.Medicamentos_Pedidos (
	Id_pedido INT,
	Id_medicamento INT,
	Cantidad INT,
	Precio DOUBLE,
	FOREIGN KEY (Id_pedido) REFERENCES pedidos(Id_pedido),
	FOREIGN KEY (Id_medicamento) REFERENCES Medicamentos(Id_medicamento),
	PRIMARY KEY (Id_pedido, Id_medicamento)
);

CREATE TABLE IF NOT EXISTS Farmacia_VitalCare.Medicamentos_Ventas(
	Id_medicamento INT,
    Id_venta INT,
    Cantidad INT,
    FOREIGN KEY (Id_medicamento) REFERENCES Medicamentos(Id_medicamento),
    FOREIGN KEY (Id_venta) REFERENCES Ventas(Id_venta),
    PRIMARY KEY (Id_medicamento, Id_venta)
);