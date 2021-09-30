CREATE TABLE Museo (
 NomeM VARCHAR(20) PRIMARY KEY,
 Citta VARCHAR(20) NOT NULL
)

CREATE TABLE Artista (
 NomeA VARCHAR(20) PRIMARY KEY,
 Nazionalita VARCHAR(20) NOT NULL
)

CREATE TABLE Opera (
 Codice INT PRIMARY KEY IDENTITY,
 Titolo VARCHAR(20) NOT NULL,
 NomeM VARCHAR(20) NOT NULL,
 NomeA VARCHAR(20) NOT NULL,
 FOREIGN KEY (NomeM) REFERENCES Museo(NomeM),
 FOREIGN KEY (NomeA) REFERENCES Artista(NomeA)
)

CREATE TABLE Personaggio (
 Personaggio VARCHAR(20) PRIMARY KEY,
 Codice INT,
 FOREIGN KEY (Codice) REFERENCES Opera(Codice)
)

INSERT INTO Museo VALUES
('Louvre','FR'),
('Uffizzi','IT'),
('Prado', 'ES');

INSERT INTO Artista VALUES
('Picasso','ES'),
('Monet','FR'),
('Giotto', 'IT');
INSERT INTO Opera VALUES
('Dipinto','Louvre','Picasso'),
('Scultura','Uffizzi','Monet'),
('Dipinto','Prado','Giotto');

INSERT INTO Personaggio VALUES 
('David',1),
('Gioconda',2),
('Orologi sciolti',2);