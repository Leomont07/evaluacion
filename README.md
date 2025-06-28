# Rent4you Data Warehouse

Este repositorio contiene los conjuntos de datos preprocesados y scripts SQL para el Data Warehouse de Rent4you, diseñado para analizar ventas, gastos, perfiles de clientes y eficiencia operativa.
## Estructura del Repositorio
- **data/**: Contiene los archivos CSV con datos preprocesados.
  - `sucursal.csv`: Dimensión de sucursales (ID_Sucursal, Nombre_Sucursal, Ciudad, Pais, Gerente_Sucursal).
  - `cliente.csv`: Dimensión de clientes (ID_Cliente, Nombre_Cliente, Edad, Genero, Tipo_Licencia, Frecuencia_Alquiler).
  - `vehiculo.csv`: Dimensión de vehículos (ID_Vehículo, Tipo_Vehículo, Marca, Modelo, Costo_Seguro).
  - `empleado.csv`: Dimensión de empleados (ID_Empleado, Nombre_Empleado, Rol, Sucursal_Asignada, Antigüedad).
  - `categoria_gasto.csv`: Dimensión de categorías de gasto (ID_Categoria_Gasto, Nombre_Categoria).
  - `tiempo.csv`: Dimensión de tiempo (ID_Fecha, Dia, Mes, Año, Dia_Semana).
  - `ventas.csv`: Tabla de hechos de ventas (ID_Alquiler, ID_Sucursal, ID_Cliente, ID_Vehículo, ID_Empleado, Fecha_Alquiler, Duración_Alquiler_Dias, Monto_Alquiler, Descuento_Aplicado, Seguro_Contratado).
  - `gastos.csv`: Tabla de hechos de gastos (ID_Gasto, ID_Sucursal, ID_Categoria_Gasto, ID_Empleado, Fecha_Gasto, Monto_Gasto, Descripción_Gasto).
- **sql/**: Scripts SQL para crear y cargar las tablas.
  - `db.sql`: Crea la base de datos `Rent4you_DW`, el esquema `rent4you_analytics` y todas las tablas con sus índices.
  - `script.sql`: Carga los datos desde los archivos CSV a las tablas.

## Requisitos
- MySQL (versión 8.0 o superior).
- Cliente SQL (como MySQL Workbench o la terminal `mysql`).

## Instrucciones de Uso
1. Instala y configura MySQL en tu sistema.
2. Crea la base de datos ejecutando el script `sql/create_tables.sql` en MySQL para configurar `Rent4you_DW` y el esquema `rent4you_analytics` con todas las tablas.
3. Mueve los archivos CSV de la carpeta `data/` a una carpeta permitida por MySQL (p. ej., `/var/lib/mysql-files/` en Linux).
4. Actualiza las rutas de los archivos CSV en `sql/load_data.sql` para que coincidan con la ubicación de los archivos en tu sistema.
5. Habilita la carga de archivos locales en MySQL ejecutando:
   ```sql
   SET GLOBAL local_infile = 1;
