-------------------------

SELECT * FROM Materiales

-------------------------

SELECT * FROM Materiales
Where clave = 1000

-------------------------

SELECT Clave, RFC, Fecha FROM Entregan

-------------------------

SELECT * FROM Materiales, Entregan
WHERE Materiales.Clave = Entregan.Clave

-------------------------

SELECT * FROM Entregan, Proyectos
WHERE Entregan.Numero <= Proyectos.Numero

--------------------------

(SELECT * FROM Entregan WHERE Clave = 1450)
UNION
(SELECT * FROM Entregan WHERE Clave = 1300)

SELECT * FROM Entregan
WHERE Clave = 1450 OR Clave = 1300

----------------------------

(SELECT Clave FROM Entregan
WHERE Numero = 5001)
INTERSECT
(SELECT Clave FROM Entregan
WHERE Numero = 5018)

SELECT Clave FROM Entregan 
WHERE Numero = 5001 and Clave
IN
(SELECT Clave FROM Entregan 
WHERE Numero = 5018)

-----------------------------

SELECT * FROM Entregan
WHERE Clave NOT IN 
(SELECT Clave FROM Entregan
WHERE Clave = 1000)

-----------------------------

SELECT * FROM Entregan, Materiales

-----------------------------

set dateformat dmy
SELECT Descripcion FROM Materiales, Entregan
WHERE Materiales.Clave = Entregan.Clave AND
Fecha BETWEEN '01/01/00' AND '31/12/00'

------------------------------

SELECT DISTINCT Descripcion FROM Materiales, Entregan
WHERE Materiales.Clave = Entregan.Clave AND
Fecha BETWEEN '01/01/00' AND '31/12/00'

-------------------------------

SELECT Proyectos.Numero, Denominacion, Fecha, Cantidad 
FROM Entregan, Proyectos
WHERE Entregan.Numero = Proyectos.Numero
ORDER BY Proyectos.Numero ASC, Fecha DESC

---------------------------------

SELECT * FROM Materiales
WHERE Descripcion LIKE 'Si%'

---------------------------------

DECLARE @foo varchar(40);
DECLARE @bar varchar(40);
SET @foo = '¿Que resultado';
SET @bar = ' ¿¿¿??? '
SET @foo += ' obtienes?';
PRINT @foo + @bar;

---------------------------------

SELECT RFC FROM Entregan WHERE RFC LIKE '[A-D]%';
SELECT RFC FROM Entregan WHERE RFC LIKE '[^A]%';
SELECT Numero FROM Entregan WHERE Numero LIKE '___6'; 

----------------------------------

SELECT Clave, RFC, Numero, Fecha, Cantidad
FROM Entregan
WHERE Numero Between 5000 and 5010; 

----------------------------------

SELECT RFC, Cantidad, Fecha, Numero
FROM [Entregan]
WHERE [Numero] Between 5000 and 5010 AND
Exists (SELECT [RFC]
FROM [Proveedores]
WHERE RazonSocial LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC])

-----------------------------------

SELECT RFC,Cantidad, Fecha,Numero
FROM [Entregan] e
WHERE [Numero] Between 5000 and 5010 AND  e.RFC
IN (SELECT [RFC]
FROM [Proveedores]
WHERE RazonSocial LIKE 'La%')

-----------------------------------

SELECT RFC,Cantidad, Fecha,Numero
FROM [Entregan] e
WHERE [Numero] Between 5000 and 5010 AND e.RFC
NOT IN (SELECT [RFC]
FROM [Proveedores]
WHERE RazonSocial NOT LIKE 'La%')

-----------------------------------

SELECT TOP 2 * FROM Proyectos 

-----------------------------------

SELECT TOP Numero FROM Proyectos

-----------------------------------

ALTER TABLE materiales ADD PorcentajeImpuesto NUMERIC(6,2); 
UPDATE materiales SET PorcentajeImpuesto = 2*clave/1000; 

------------------------------------

SELECT E.Clave, E.Cantidad*(M.Costo*(PorcentajeImpuesto/100)+1) as "Total"
FROM Materiales M, Entregan E
WHERE M.Clave=E.Clave

------------------------------------

CREATE VIEW Menor AS (
SELECT * FROM Materiales
WHERE Clave = 1000
)

SELECT * FROM Menor

-------------------------------------

CREATE VIEW EmpiezanAD AS (
SELECT RFC FROM Entregan 
WHERE RFC LIKE '[A-D]%'
)
SELECT * FROM EmpiezanAD

-------------------------------------

CREATE VIEW MaterialSI AS (
SELECT * FROM Materiales 
WHERE Descripcion LIKE 'Si%' 
)
SELECT * FROM MaterialSI

-------------------------------------
CREATE VIEW Numero AS(
SELECT Clave, RFC, Numero, Fecha, Cantidad
FROM Entregan
WHERE Numero Between 5000 and 5010
)
SELECT * FROM Numero

-------------------------------------
CREATE VIEW RazonLa AS(
SELECT RFC,Cantidad, Fecha,Numero
FROM [Entregan] e
WHERE [Numero] Between 5000 and 5010 AND  e.RFC
IN (SELECT [RFC]
FROM [Proveedores]
WHERE RazonSocial LIKE 'La%')
)
SELECT * FROM RazonLa
-------------------------------------

-------------------------------------

SELECT E.Clave, M.Descripcion
FROM Materiales as M, Entregan as E, Proyectos as P
WHERE M.Clave=E.Clave AND P.Numero=E.Numero AND P.Denominacion='Mexico sin ti no estamos completos'

--------------------------------------

SELECT E.Clave, M.Descripcion
FROM Materiales as M, Entregan as E, Proveedores as P
WHERE M.Clave=E.Clave AND P.RFC=E.RFC AND P.RazonSocial='Acme tools'

---------------------------------------

SELECT E.RFC
FROM Entregan as E
WHERE E.Cantidad>=300 AND (Fecha Between '01-JAN-2000' AND '31-DEC-2000')

-----------------------------------------

SELECT E.Clave, SUM(Cantidad) as 'Total'
FROM Entregan as E
WHERE (Fecha Between '01-JAN-2000' AND '31-DEC-2000')
GROUP BY E.Clave

------------------------------------------

SELECT TOP 1 E.Clave, SUM(Cantidad) as 'Total'
FROM Entregan as E
WHERE (Fecha Between '01-JAN-2001' AND '31-DEC-2001')
GROUP BY E.Clave
ORDER BY Total DESC

-------------------------------------------

SELECT descripcion
FROM Materiales AS M
WHERE descripcion LIKE '%ub%';

-------------------------------------------

SELECT P.Denominacion, SUM(E.Cantidad*(M.Costo*(PorcentajeImpuesto/100)+1)) as "Total"
FROM Entregan AS E, Proyectos AS P, Materiales AS M
WHERE P.Numero=E.Numero AND M.Clave=E.Clave
GROUP BY P.Denominacion

-------------------------------------------

CREATE VIEW televisaNoCoahuila1 AS
(SELECT DISTINCT P.Denominacion, PR.RFC, PR.RazonSocial
FROM Entregan AS E, Proyectos AS P, Proveedores as PR
WHERE P.Numero=E.Numero AND PR.RFC=E.RFC AND P.Denominacion LIKE 'Tel%' AND PR.RFC
NOT IN (SELECT PR.RFC FROM Entregan AS E, Proyectos AS P, Proveedores as PR
WHERE P.Numero=E.Numero AND PR.RFC=E.RFC AND P.Denominacion LIKE 'Edu%' ))

select * from televisaNoCoahuila1
DROP VIEW televisaNoCoahuila1

--------------------------------------------

SELECT DISTINCT P.Denominacion, PR.RFC, PR.RazonSocial
FROM Entregan AS E, Proyectos AS P, Proveedores as PR
WHERE P.Numero=E.Numero AND PR.RFC=E.RFC AND P.Denominacion LIKE 'Tel%' AND PR.RFC 
NOT IN (SELECT PR.RFC FROM Entregan AS E, Proyectos AS P, Proveedores as PR
WHERE P.Numero=E.Numero AND PR.RFC=E.RFC AND P.Denominacion LIKE 'Edu%')

---------------------------------------------

SELECT M.Costo, M.Descripcion
FROM Entregan AS E, Proyectos AS P, Materiales AS M, Proveedores AS PR
WHERE P.Numero=E.Numero AND PR.RFC=E.RFC AND M.Clave=E.Clave AND M.Clave=E.Clave AND P.Denominacion LIKE 'Tel%' AND PR.RFC 
IN(
SELECT PR.RFC
FROM Entregan AS E, Proyectos AS P, Proveedores as PR
WHERE P.Numero=E.Numero AND PR.RFC=E.RFC AND P.Denominacion LIKE 'Edu%')

----------------------------------------------

SELECT M.Descripcion, P.Denominacion, SUM(E.Cantidad) as 'cantidadEntrega', SUM(E.Cantidad*(M.Costo*(PorcentajeImpuesto/100)+1)) as "costoTotal"
FROM Entregan AS E, Materiales AS M,  Proyectos AS P
WHERE M.Clave=E.Clave AND P.Numero=E.Numero
GROUP BY M.Descripcion, P.Denominacion







