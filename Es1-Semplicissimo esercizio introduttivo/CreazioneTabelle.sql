CREATE TABLE Impiegato(
	nome varchar(30) PRIMARY KEY,
	titolo varchar(50),
	eta int NOT NULL,
	salario decimal(12,2),
	dip char(1)
)

CREATE TABLE [dbo].[Cliente]
(
	[IdCiente] INT NOT NULL PRIMARY KEY IDENTITY,
	[nome] VARCHAR(30) NOT NULL, 
    [cognome] VARCHAR(50) NOT NULL, 
    [citta] VARCHAR(50) NOT NULL, 
    [stato] VARCHAR(3) NOT NULL
)

