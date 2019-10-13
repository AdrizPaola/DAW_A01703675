-- La suma de las cantidades e importe total de todas las entregas realizadas durante el 97.
SET DATEFORMAT dmy
SELECT SUM(E.Cantidad) AS 'Suma Cantidades',
       SUM(E.Cantidad*((M.Costo*((M.PorcentajeImpuesto/100)+1)))) AS 'Importe Total'
FROM Entregan As E, Materiales AS M
WHERE M.Clave = E.Clave AND (E.Fecha BETWEEN '01/01/97' AND '31/12/97')


-- Para cada proveedor, obtener la razón social del proveedor, número de entregas e importe total de las entregas realizadas. 
SELECT Prov.RazonSocial, COUNT(E.Cantidad) AS  'Numero de Entregas',
       SUM(((M.Costo*((M.PorcentajeImpuesto/100)+1)))*E.Cantidad) AS 'Importe Total'
FROM Proveedores AS Prov, Entregan AS E, Materiales AS M
WHERE Prov.RFC = E.RFC AND M.Clave = E.Clave
GROUP BY Prov.RazonSocial


-- Por cada material obtener la clave y descripción del material, la cantidad total entregada, la mínima cantidad entregada, la máxima cantidad entregada, el importe total de las entregas de aquellos materiales en los que la cantidad promedio entregada sea mayor a 400. 
SELECT M.Clave, M.Descripcion, SUM(E.Cantidad) AS 'Cantidad Total Entregada',
	   MIN(E.Cantidad) AS 'Minima Cantidad Entregada',
	   MAX(E.Cantidad) AS 'Maxima Cantidad Entregada',
	   SUM(((M.Costo*((M.PorcentajeImpuesto/100)+1)))*E.Cantidad) AS 'Importe Total'
FROM Materiales AS M, Entregan AS E
WHERE M.Clave = E.Clave
GROUP BY M.Clave, M.Descripcion
HAVING AVG(E.Cantidad) > 400


-- Para cada proveedor, indicar su razón social y mostrar la cantidad promedio de cada material entregado, detallando la clave y descripción del material, excluyendo aquellos proveedores para los que la cantidad promedio sea menor a 500. 
SELECT Prov.RazonSocial, AVG(E.Cantidad) AS 'Promedio De Material', M.Clave, M.Descripcion
FROM Proveedores AS Prov, Materiales as M, Entregan as E
WHERE Prov.RFC = E.RFC AND M.Clave = E.Clave
GROUP BY Prov.RazonSocial, M.Clave, M.Descripcion
HAVING AVG(E.Cantidad) >= 500
 

-- Mostrar en una sola consulta los mismos datos que en la consulta anterior pero para dos grupos de proveedores: aquellos para los que la cantidad promedio entregada es menor a 370 y aquellos para los que la cantidad promedio entregada sea mayor a 450. 
SELECT Prov.RazonSocial, M.Clave, M.Descripcion,
       AVG(E.Cantidad) AS 'Promedio Material'
FROM Proveedores AS Prov, Materiales AS M, Entregan AS E
WHERE Prov.RFC = E.RFC AND M.Clave = E.Clave
GROUP BY Prov.RazonSocial, M.Clave, M.Descripcion
HAVING AVG(E.Cantidad) < 370 OR AVG(E.Cantidad) > 450
       


-- Considerando que los valores de tipos CHAR y VARCHAR deben ir encerrados entre apóstrofes, los valores numéricos se escriben directamente y los de fecha, como '1-JAN-00' para 1o. de enero del 2000, inserta cinco nuevos materiales. 

INSERT INTO Materiales VALUES (1440, 'Lamina', 500, 7);
INSERT INTO Materiales VALUES (1450, 'Azulejo', 300, 8);
INSERT INTO Materiales VALUES (1460, 'Tinaco', 1500, 2);
INSERT INTO Materiales VALUES (1470, 'Block', 700, 3);
INSERT INTO Materiales VALUES (1480, 'Puerta', 1300, 1);


-- Clave y descripción de los materiales que nunca han sido entregados.
SELECT M.Clave, M.Descripcion
FROM Materiales AS M
WHERE M.Clave NOT IN (
SELECT E.Clave
FROM Entregan AS E)


-- Razón social de los proveedores que han realizado entregas tanto al proyecto 'Vamos México' como al proyecto 'Querétaro Limpio'.

SELECT Prov.RazonSocial
FROM Proveedores AS Prov, Proyectos AS P
WHERE Prov.RazonSocial IN(
  SELECT Prov.RazonSocial
  FROM Proveedores AS Prov
  WHERE Prov.RazonSocial = 'Vamos México'
) 
AND Prov.RFC IN(
  SELECT Prov.RazonSocial
  FROM Proveedores AS Prov
  WHERE Prov.RazonSocial = 'Querétaro Limpio'
)


SELECT M.Descripcion
FROM Materiales AS M
WHERE M.Clave NOT IN(
  SELECT E.Clave
  FROM Proyectos AS P, Entregan AS E
  WHERE P.Numero = E.Numero AND P.Denominacion LIKE 'CIT Yucatan'
)

SELECT * FROM Materiales
SELECT * FORM Proyectos P, Entregan E 
WHERE E.Numero = P.Numero


-- Razón social y promedio de cantidad entregada de los proveedores cuyo promedio de cantidad entregada es mayor al promedio de la cantidad entregada por el proveedor con el RFC 'VAGO780901'. 

SELECT Prov.RazonSocial, AVG(E.Cantidad) AS 'Promedio De Cantidad Entregada'
FROM Entregan AS E, Proyectos AS P,Proveedores AS Prov
WHERE P.Numero = E.Numero AND Prov.RFC = E.RFC
GROUP BY Prov.RazonSocial
HAVING AVG(E.Cantidad)> (SELECT AVG(E.Cantidad)
  FROM Entregan AS E
  WHERE E.RFC='VAGO780901'
)
 

-- RFC, razón social de los proveedores que participaron en el proyecto 'Infonavit Durango' y cuyas cantidades totales entregadas en el 2000 fueron mayores a las cantidades totales entregadas en el 2001.

set dateformat dmy
SELECT Prov.RFC, Prov.RazonSocial
FROM Entregan AS E, Proyectos AS P,Proveedores AS Prov
WHERE P.Numero = E.Numero AND Prov.RFC = E.RFC AND Prov.RazonSocial='Infonavit Durango'
GROUP BY Prov.RFC, Prov.RazonSocial
  HAVING (SELECT SUM(E.Cantidad)
  FROM Entregan AS E, Proyectos AS P, Proveedores AS Prov
  WHERE P.Numero = E.Numero AND Prov.RFC = E.RFC AND (E.Fecha BETWEEN '01/01/2000' AND '31/12/2000')
)
  > (SELECT SUM(E.Cantidad)
  FROM Entregan AS E, Proyectos AS P, Proveedores AS Prov
  WHERE P.Numero = E.Numero AND Prov.RFC = E.RFC AND (E.Fecha BETWEEN '01/01/2001' AND '31/12/2001')
)







