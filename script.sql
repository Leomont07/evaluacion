-- Cargar datos desde CSV
LOAD DATA INFILE '/sucursal.csv'
INTO TABLE dim_sucursal
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_Sucursal, Nombre_Sucursal, Ciudad, Pais, Gerente_Sucursal);

LOAD DATA INFILE '/cliente.csv'
INTO TABLE dim_cliente
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_Cliente, Nombre_Cliente, Edad, Genero, Tipo_Licencia, Frecuencia_Alquiler);

LOAD DATA IN Ela dim_vehiculo
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_Vehículo, Tipo_Vehículo, Marca, Modelo, Costo_Seguro);

LOAD DATA INFILE '/empleado.csv'
INTO TABLE dim_empleado
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_Empleado, Nombre_Empleado, Rol, Sucursal_Asignada, Antigüedad);

LOAD DATA INFILE '/categoria_gasto.csv'
INTO TABLE dim_categoria_gasto
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_Categoria_Gasto, Nombre_Categoria);

LOAD DATA INFILE '/tiempo.csv'
INTO TABLE dim_tiempo
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_Fecha, Dia, Mes, Año, Dia_Semana);

LOAD DATA INFILE '/ventas.csv'
INTO TABLE fact_ventas
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_Alquiler, ID_Sucursal, ID_Cliente, ID_Vehículo, ID_Empleado, Fecha_Alquiler, Duración_Alquiler_Dias, Monto_Alquiler, Descuento_Aplicado, Seguro_Contratado);

LOAD DATA INFILE '/gastos.csv'
INTO TABLE fact_gastos
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_Gasto, ID_Sucursal, ID_Categoria_Gasto, ID_Empleado, Fecha_Gasto, Monto_Gasto, Descripción_Gasto);