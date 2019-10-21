--- Insertar un registro
IF EXISTS (SELECT name FROM sysobjects
            WHERE name = 'creaMaterial' AND type = 'P')
    DROP PROCEDURE creaMaterial
GO

CREATE PROCEDURE creaMaterial
    @uclave NUMERIC(5,0),
    @udescripcion VARCHAR(50),
    @ucosto NUMERIC(8,2),
    @uimpuesto NUMERIC(6,2)
AS
    INSERT INTO Materiales VALUES(@uclave, @udescripcion, @ucosto, @uimpuesto)
GO

--- Ejecutar SP:
EXECUTE creaMaterial 5000,'Martillos Acme',250,15

--- Modificar registro
IF EXISTS (Select name FROM sysobjects 
           WHERE name = 'modificaMaterial' AND type = 'P')
	DROP PROCEDURE modificaMaterial
GO

CREATE PROCEDURE modificaMaterial
	@uclave NUMERIC(5,0),
	@udescripcion VARCHAR(50),
	@ucosto NUMERIC(8,2),
	@uimpuesto NUMERIC(6,2)
AS 
   UPDATE Materiales SET Descripcion = @udescripcion, Costo = @ucosto, PorcentajeImpuesto = @uimpuesto 
   WHERE Clave = @uclave
GO


EXECUTE modificaMaterial 1470,'Remachador',300,4
SELECT * FROM Materiales	


--- Eliminar registro
IF EXISTS (SELECT name FROM sysobjects
           WHERE name = 'eliminaMaterial' AND type = 'P')
	DROP PROCEDURE eliminaMaterial
GO

CREATE PROCEDURE eliminaMaterial
	@uclave NUMERIC(5,0)
AS
	DELETE FROM Materiales WHERE Clave = @uclave
GO

EXECUTE eliminaMaterial 5000
SELECT * FROM Materiales


--- Procedures Proyectos:
--- Inserta registro
IF EXISTS (SELECT name FROM sysobjects
		   WHERE name = 'creaProyecto' AND type = 'P')
		DROP PROCEDURE creaProyecto
GO

CREATE PROCEDURE creaProyecto
	@unumero NUMERIC(5,0),
	@udenominacion VARCHAR(50)
AS
	INSERT INTO Proyectos VALUES(@unumero, @udenominacion)
GO

EXECUTE creaProyecto 4413,'BD-DAW'
SELECT * FROM Proyectos


--- Modifica Registro
IF EXISTS (SELECT name FROM sysobjects 
           WHERE name = 'modificaProyecto' AND type = 'P')
	DROP PROCEDURE modificaProyecto
GO

CREATE PROCEDURE modificaProyecto
	@unumero NUMERIC(5,0),
	@udenominacion VARCHAR(50)
AS
	UPDATE Proyectos SET Denominacion = @udenominacion WHERE Numero = @unumero
GO

EXECUTE modificaProyecto 4413,'BD-DAW1'
SELECT * FROM Proyectos

--- Elimina Proyecto
IF EXISTS (SELECT name FROM sysobjects 
	       WHERE name = 'eliminaProyecto' AND type = 'P')
	DROP PROCEDURE eliminaProyecto
GO

CREATE PROCEDURE eliminaProyecto
	@unumero NUMERIC(5,0)
AS
	DELETE FROM Proyectos WHERE Numero = @unumero
GO

EXECUTE eliminaProyecto 4413
SELECT * FROM Proyectos


--- Proveedores
--- Inserta registro
IF EXISTS (SELECT name FROM sysobjects 
		   WHERE name = 'creaProveedor' AND type = 'P')
	DROP PROCEDURE creaProveedor
GO

CREATE PROCEDURE creaProveedor
	@urfc CHAR(13),
	@urazonsocial VARCHAR(50)
AS
	INSERT INTO Proveedores VALUES(@urfc, @urazonsocial)
GO

EXECUTE creaProveedor 'AAAA441310', 'Adriana'
SELECT * FROM Proveedores

--- Modifica registro
IF EXISTS (SELECT name FROM sysobjects
		   WHERE name = 'modificaProveedor' AND type = 'P')
	DROP PROCEDURE modificaProveedor
GO

IF EXISTS (SELECT name FROM sysobjects 
           WHERE name = 'modificaProveedor' AND type = 'P')
    DROP PROCEDURE modificaProveedor
GO

CREATE PROCEDURE modificaProveedor
    @urfc CHAR(13),
    @urazonsocial VARCHAR(50)
AS
    UPDATE Proveedores SET RazonSocial = @urazonsocial WHERE RFC=@urfc
GO

EXECUTE modificaProveedor 'AAAA441310','Paola'
SELECT * FROM Proveedores

--- Eliminar Registro
IF EXISTS (SELECT name FROM sysobjects 
           WHERE name = 'eliminaProveedor' AND type = 'P')
	DROP PROCEDURE eliminaProveedor
GO

CREATE PROCEDURE eliminaProveedor
	@urfc CHAR(13)
AS
	DELETE FROM Proveedores WHERE RFC = @urfc
GO

EXECUTE eliminaProveedor 'AAAA441310'
SELECT * FROM Proveedores

--- Entregan
--- Insertar Registro 
IF EXISTS (SELECT name FROM sysobjects 
           WHERE name = 'creaEntrega' AND type = 'P')
	DROP PROCEDURE creaEntrega
GO

CREATE PROCEDURE creaEntrega
    @uclave NUMERIC(5,0),
    @urfc CHAR(13),
    @unumero NUMERIC(5),
    @ufecha DATETIME,
    @ucantidad NUMERIC(8,2)
AS
    INSERT INTO Entregan VALUES(@uclave, @urfc, @unumero, @ufecha,@ucantidad)
GO

SET DATEFORMAT dmy
EXECUTE creaEntrega 1000, 'AAAA800101', 5019, '08/10/2002', 10
SELECT * FROM Entregan

--- Modifica Registro
IF EXISTS (SELECT name FROM sysobjects 
           WHERE name = 'modificaEntrega' AND type = 'P')
    DROP PROCEDURE modificaEntrega
GO

CREATE PROCEDURE modificaEntrega
    @uclave NUMERIC(5,0),
    @urfc CHAR(13),
    @unumero NUMERIC(5),
    @ufecha DATETIME,
    @ucantidad NUMERIC(8,2)
AS
    UPDATE Entregan SET Fecha = @ufecha, Cantidad = @ucantidad  
	       WHERE Clave = @uclave AND RFC = @urfc AND Numero = @unumero
GO

SET DATEFORMAT dmy
EXECUTE modificaEntrega 1000, 'AAAA800101', 5000, '10/8/2002', 10
SELECT * FROM Entregan

--- Elimina Registro
IF EXISTS (SELECT name FROM sysobjects 
             WHERE name = 'eliminaEntrega' AND type = 'P')
    DROP PROCEDURE eliminaEntrega
GO

CREATE PROCEDURE eliminaEntrega
    @uclave NUMERIC(5,0),
    @urfc CHAR(13),
    @unumero NUMERIC(5)
AS
    DELETE FROM Entregan WHERE Clave = @uclave AND RFC = @urfc AND Numero = @unumero
GO


SET DATEFORMAT dmy
EXECUTE eliminaEntrega 1000, 'AAAA800101', 5019
SELECT * FROM Entregan


--- Consultas con parámetros
IF EXISTS (SELECT name FROM sysobjects
           WHERE name = 'queryMaterial' AND type = 'P')
	DROP PROCEDURE queryMaterial
GO

CREATE PROCEDURE queryMaterial
    @udescripcion VARCHAR(50),
    @ucosto NUMERIC(8,2)

AS
    SELECT * FROM Materiales WHERE descripcion
    LIKE '%'+@udescripcion+'%' AND costo > @ucosto
GO

EXECUTE queryMaterial 'Lad',20




--- MYSQL - LAB DAW FRUTAS ---

DROP PROCEDURE IF EXISTS creaFruta;
//
CREATE PROCEDURE creaFruta(
 IN name VARCHAR(25),
 IN units VARCHAR(25),
 IN quantity INT(10),
 IN price INT(10),
 IN country VARCHAR(25)
) 
BEGIN
INSERT INTO Frutas VALUES (name,units,quantity,price,country));
END//

CALL sp_in('FrutaPrueba','Kilogramos',3,50,'Mexico');


---  IMPLEMENTACIÓN DE STORED PROCEDURES EN EL PROYECTO  ---
--- Ubicación: Git del equipo 
