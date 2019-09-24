CREATE TABLE Materiales
(
	Clave numeric(5),
	Descripción varchar(50),
	Costo numeric(8,2)
)

CREATE TABLE Proveedores
(
	RFC char(13),
	RazonSocial varchar(50)
)

CREATE TABLE Proyectos
(
	Numero numeric(5),
	Denominación varchar(50)
)

CREATE TABLE Entregan
(
	Clave numeric(5),
	RFC char(13),
	Numero numeric(5),
	Fecha datetime,
	Cantidad numeric(8,2)
)