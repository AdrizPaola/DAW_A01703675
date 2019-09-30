ALTER TABLE Materiales add constraint llaveMateriales PRIMARY KEY (Clave)

INSERT INTO Materiales values(1000, 'xxx', 1000) 


--Verificar si tiene definido algún constaint
sp_helpconstraint materiales 



--Llave proyectos
ALTER TABLE Proyectos add constraint llaveProyectos PRIMARY KEY (Numero)
sp_helpconstraint Proyectos 

--Llave proveedores
ALTER TABLE Proveedores add constraint llaveProveedores PRIMARY KEY (RFC)
sp_helpconstraint Proveedores 

--Llave entregan
ALTER TABLE Entregan add constraint llaveEntregan PRIMARY KEY (Clave, Numero, RFC, Fecha)
sp_helpconstraint Entregan 