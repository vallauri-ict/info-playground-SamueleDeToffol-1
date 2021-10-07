DROP TABLE AutoCoinvolte,_Auto, Sinistro, Assicurazioni, Proprietari;

CREATE TABLE Proprietari(
	CodF int PRIMARY KEY IDENTITY,
	Nome varchar(50) NOT NULL,
	Residenza varchar(40) NOT NULL
)

CREATE TABLE Assicurazioni(
	CodAss int PRIMARY KEY IDENTITY,
	Nome varchar(30) NOT NULL,
	Sede varchar(40) NOT NULL
)

CREATE TABLE Sinistro(
	CodS int PRIMARY KEY IDENTITY,
	Localita varchar(40) NOT NULL,
	DataS DATETIME NULL
)

CREATE TABLE _Auto(
	Targa varchar(20) PRIMARY KEY,
	Marca varchar(30) NOT NULL,
	Cilindrata int NOT NULL ,
	Potenza int NOT NULL,
	CodF int FOREIGN KEY REFERENCES  Proprietari(CodF),
	CodAss int FOREIGN KEY REFERENCES Assicurazioni(CodAss)
)

CREATE TABLE AutoCoinvolte(
	CodS int FOREIGN KEY REFERENCES Sinistro(CodS),
	Targa varchar(20) FOREIGN KEY REFERENCES _Auto(Targa),
	ImportoDelDanno int NOT NULL
)


INSERT INTO Proprietari VALUES
('Samuele','Torino'),
('Marco','Cuneo'),
('Paolo','Genova');

INSERT INTO Assicurazioni VALUES
('ConTe','Roma'),
('Allianz','Torino'),
('Unicredit','Milano');

INSERT INTO Sinistro VALUES
('Cuneo','03052021'),
('Savigliano','09092020'),
('Bra','22062021');

INSERT INTO _Auto VALUES
('EL668XN','Audi',100,50),
('GC446BF','Opel',300,80),
('FA279CH','BMW',250,70);

INSERT INTO AutoCoinvolte VALUES
(10000),
(20000),
(1000);