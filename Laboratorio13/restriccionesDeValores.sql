INSERT INTO entregan values (1000, 'AAAA800101', 5000, GETDATE(), 0); 

Delete from Entregan where Cantidad = 0

--Asignar restricción de cantidad mayor a cero
ALTER TABLE entregan add constraint cantidad check (cantidad > 0);

INSERT INTO entregan values (1000, 'AAAA800101', 5000, GETDATE(), 0); 


--Revisar constraint
sp_helpconstraint entregan