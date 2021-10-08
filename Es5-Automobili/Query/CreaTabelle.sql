DROP TABLE AutoCoinvolta,Automobile,Sinistro,Proprietario,Assicurazione;

CREATE TABLE Proprietario(
CodF VARCHAR(5) PRIMARY KEY,
Nome VARCHAR(20),
Residenza VARCHAR(25)
)

INSERT INTO Proprietario VALUES
('RCCPL','Paolo','Cuneo'),
('DTF','Samuele','Torino'),
('DLL','Luca','Alba')

UPDATE Proprietario SET
Nome= 'Antonio'
WHERE CodF = 'RCCPL'

CREATE TABLE Assicurazione(
CodAss INT PRIMARY KEY,
Nome VARCHAR(20),
Sede VARCHAR(25)
)

INSERT INTO Assicurazione VALUES
(1,'Generali','Cuneo'),
(2,'Toro','Savigliano'),
(3,'Sara','Savigliano')

UPDATE Assicurazione SET
Nome='Arancio'
WHERE CodAss=1


CREATE TABLE Automobile(
Targa VARCHAR(10) PRIMARY KEY,
Marca VARCHAR(10),
Cilindrata INT,
Potenza INT,
CodF VARCHAR(5),
CodAss INT,
FOREIGN KEY (CodF) REFERENCES Proprietario(CodF),
FOREIGN KEY (CodAss) REFERENCES Assicurazione(CodAss)
)

INSERT INTO Automobile VALUES 
('EF999IT','Fiat',2000,150,'RCCPL',3),
('EL899IT','Audi',1600,90,'DTF',2),
('GA900IL','Fiat',2000,120,'DLL',1)


CREATE TABLE Sinistro(
CodS INT PRIMARY KEY,
Localita VARCHAR(20),
Data DATE
)

INSERT INTO Sinistro VALUES
(1,'Alba','2002-01-20'),
(2,'Cuneo','2021-01-10')

UPDATE Sinistro SET
Data='2021-02-19'
WHERE CodS=2

CREATE TABLE AutoCoinvolta(
CodS INT,
Targa VARCHAR(10),
ImportoDelDanno INT,
PRIMARY KEY(CodS,Targa),
FOREIGN KEY (CodS) REFERENCES Sinistro(CodS),
FOREIGN KEY (Targa) REFERENCES Automobile(Targa)
)

INSERT INTO AutoCoinvolta VALUES
(1,'EF999IT',250),
(2,'EL899IT',400),
(1,'EL899IT',520)