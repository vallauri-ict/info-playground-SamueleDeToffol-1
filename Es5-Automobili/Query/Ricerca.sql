SELECT Targa,Marca FROM Automobile
WHERE Potenza>120 OR Cilindrata>2000;

SELECT Nome,Marca FROM Automobile, Proprietario
WHERE Proprietario.CodF=Automobile.CodF AND Potenza>120 OR Cilindrata>2000;

SELECT p.Nome,Targa FROM Automobile, Proprietario p, Assicurazione a
WHERE p.CodF=Automobile.CodF AND Automobile.CodAss=a.CodAss
AND (Potenza>120 OR Cilindrata>2000) AND a.Nome='Sara';

SELECT DISTINCT p.Nome,au.Targa FROM Automobile au, Proprietario p, Assicurazione a, Sinistro s, AutoCoinvolta
WHERE p.CodF=au.CodF AND au.CodAss=a.CodAss AND s.CodS=AutoCoinvolta.CodS AND AutoCoinvolta.Targa=au.Targa
AND s.Data='2002-01-20' AND a.Nome='Sara'