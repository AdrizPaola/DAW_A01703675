

--Cargar datos a las tablas
BULK INSERT a1703675.a1703675.[Materiales] 
  FROM 'e:\wwwroot\rcortese\materiales.csv' 
  WITH 
  ( 
    CODEPAGE = 'ACP', 
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n' 
  ) 

BULK INSERT a1703675.a1703675.[Proyectos] 
  FROM 'e:\wwwroot\rcortese\Proyectos.csv' 
  WITH 
  ( 
    CODEPAGE = 'ACP', 
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n' 
  ) 

BULK INSERT a1703675.a1703675.[Proveedores] 
  FROM 'e:\wwwroot\rcortese\Proveedores.csv' 
  WITH 
  ( 
    CODEPAGE = 'ACP', 
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n' 
  ) 

SET DATEFORMAT dmy -- especificar formato de la fecha 

BULK INSERT a1703675.a1703675.[Entregan] 
  FROM 'e:\wwwroot\rcortese\Entregan.csv' 
  WITH 
  ( 
    CODEPAGE = 'ACP', 
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n' 
  )
