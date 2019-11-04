CREATE TABLE IF NOT EXISTS Zombie(
    ID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre varchar(30) NOT NULL
); 

CREATE TABLE IF NOT EXISTS Estado(
    ID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nombre varchar(30) NOT NULL 
);

CREATE TABLE IF NOT EXISTS Registro(
    IDZombie int NOT NULL,
    IDEstado int NOT NULL,
    FechaHora TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (IDZombie) REFERENCES Zombie(ID),
	FOREIGN KEY(IDEstado) REFERENCES Estado(ID)
);


DELIMITER //
CREATE PROCEDURE RegistrarZombie(nombre varchar(30))
BEGIN
    INSERT INTO Zombie(nombre) VALUES (nombre);
END //

DELIMITER;
DELIMITER //


DELIMITER $$
CREATE PROCEDURE `HistorialZombies`(IN `id` INT)
BEGIN
    SELECT  Nombre, FechaHora
FROM  Estado, Registro
WHERE Estado.ID = Registro.IDEstado AND Registro.IDZombie = id;

END$$
DELIMITER ;


INSERT INTO `Zombie` (`ID`, `Nombre`) VALUES
(NULL, 'Eduardo'),
(NULL, 'Ricardo'),
(NULL, 'Adriana');


INSERT INTO `Estado` (`ID`, `Nombre`) VALUES
(NULL, 'Infección'),
(NULL, 'Desorientación'),
(NULL, 'Violencia'),
(NULL, 'Desmayo');


INSERT INTO `Registro` (`IDZombie`, `IDEstado`, `FechaHora`) VALUES
(2, 1, NULL);


DELIMITER $$
CREATE PROCEDURE `CantidadZombies`()
BEGIN
    SELECT COUNT(Zombie.ID) AS 'Numero Zombies'
FROM Zombie
    GROUP BY Zombie.ID;
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE `estados`()
BEGIN
	SELECT Nombre, COUNT(*) AS Cuantos
    FROM Registro, Estado 
    WHERE Estado.IDEstado = Registro.IDEstado 
    GROUP BY Nombre;
END$$
DELIMITER ;