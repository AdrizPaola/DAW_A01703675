SELECT * from Materiales;
SELECT * from Proveedores;
SELECT * from Proyectos;
SELECT * from Entregan;


INSERT INTO entregan values (0, 'xxx', 0, '1-jan-02', 0); 
Delete from Entregan where Clave = 0 


ALTER TABLE entregan add constraint cfentreganclave foreign key (clave) references materiales(clave); 

INSERT INTO entregan values (0, 'xxx', 0, '1-jan-02', 0);


--Agregar llave foranea a Entregan "RFC"
  ALTER TABLE entregan add constraint cfentreganRFC foreign key (RFC) references proveedores(RFC)
  sp_helpconstraint materiales
  
   --Agregar llave foranea a Entregan "Numero"
  ALTER TABLE entregan add constraint cfentregannumero foreign key (numero) references proyectos(numero)
  sp_helpconstraint proyectos
