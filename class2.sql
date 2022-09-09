CREATE DATABASE day2;
USE day2;
--------------------
CREATE TABLE People 
(id INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50),
last_name VARCHAR(50) NOT NULL,
age INT DEFAULT 18 ,
CHECK (age>= 18)
);
--------------------
INSERT INTO People (first_name,last_name,age) VALUES ('Justin', 'Trudau' , 5);
--ERROR 3819 (HY000): Check constraint 'People_chk_1' is violated.

INSERT INTO People (first_name,last_name,age) VALUES ('Justin', 'Trudau' , 55);
INSERT INTO People (first_name,last_name,age) VALUES ('Sheida', 'Dayani' , 33);
INSERT INTO People (first_name,last_name,age) VALUES ('Jenny', 'Bo' , 20);
INSERT INTO People (first_name,last_name,age) VALUES ('Alfonso', 'Reyese' , 28);
INSERT INTO People (first_name,last_name,age) VALUES ('Kathrine', 'Zamora' , 22);
--------------------
CREATE TABLE Addresses 
(id INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
fk_people_id INT NOT NULL,
street VARCHAR(100),
city VARCHAR(50) NOT NULL,
country VARCHAR(50) NOT NULL,
INDEX idx_addresses_city (city),
FOREIGN KEY (fk_people_id)
    REFERENCES People(id)
    ON DELETE CASCADE
);
-------------------------
INSERT INTO Addresses (fk_people_id,city,country) VALUES (6, 'Otawa', 'Canada');
--ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`day2`.`Addresses`, CONSTRAINT `Addresses_ibfk_1` FOREIGN KEY (`fk_people_id`) REFERENCES `People` (`id`) ON DELETE CASCADE)

INSERT INTO Addresses (fk_people_id,city,country) VALUES (1, 'Otawa', 'Canada');
INSERT INTO Addresses (fk_people_id,city,country) VALUES (2, 'aaa', 'Austria');
INSERT INTO Addresses (fk_people_id,city,country) VALUES (3, 'ppp', 'Philipine');
INSERT INTO Addresses (fk_people_id,city,country) VALUES (4, 'ccc', 'Colombia');
INSERT INTO Addresses (fk_people_id,city,country) VALUES (5, 'Calgary', 'Canada');
INSERT INTO Addresses (fk_people_id,city,country) VALUES (2, 'Calgary', 'Canada');
INSERT INTO Addresses (fk_people_id,city,country) VALUES (4, 'Calgary', 'Canada');
INSERT INTO Addresses (fk_people_id,city,country) VALUES (3, 'Calgary', 'Canada');
--------------------
SELECT * FROM People INNER JOIN Addresses ON People.id = Addresses.fk_people_id ; 
SELECT * FROM People , Addresses WHERE People.id = Addresses.fk_people_id;