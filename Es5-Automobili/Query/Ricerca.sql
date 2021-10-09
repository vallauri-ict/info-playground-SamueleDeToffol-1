/*1- Targa e Marca delle Auto di cilindrata superiore a 2000 cc o di potenza superiore a 120 CV*/
SELECT a.Targa, a.Marca
FROM Automobili a
WHERE a.Cilindrata > 2000
OR a.Potenza > 120

/*2- Nome del proprietario e Targa delle Auto di cilindrata superiore a 2000 cc oppure di potenza superiore a 120 CV*/
SELECT p.Nome, a.Targa
FROM Automobili a, Proprietari p
WHERE a.CodF = p.CodF
AND (a.Cilindrata > 2000 OR a.Potenza > 120)

/*3- Targa e Nome del proprietario delle Auto di cilindrata superiore a 2000 cc oppure di potenza superiore a 120 CV, assicurate presso la “SARA”*/
SELECT a.Targa, p.Nome
FROM Automobili a, Proprietari p, Assicurazioni ass
WHERE a.CodF = p.CodF
AND a.CodAss = ass.CodAss
AND (a.Cilindrata > 2000 OR a.Potenza > 120)
AND ass.Nome = 'SARA'

/*4- Targa e Nome del proprietario delle Auto assicurate presso la “SARA” e coinvolte in sinistri il 20/01/02*/
SELECT a.Targa, p.Nome
FROM Automobili a, Proprietari p, Assicurazioni ass, Autocoinvolte ac, Sinistri s
WHERE a.CodF = p.CodF
AND a.CodAss = ass.CodAss
AND ass.Nome = 'SARA'
AND ac.CodS = s.CodS
AND s.Giorno = '2002-01-20'

/*5- Per ciascuna Assicurazione, il nome, la sede ed il numero di auto assicurate*/
SELECT ass.Nome, ass.Sede, COUNT(*) AS NumeroAutoAssicurate
FROM Assicurazioni ass, Automobili a
WHERE ass.CodAss = a.CodAss
GROUP BY ass.Nome, ass.Sede, a.CodAss

/*6- Per ciascuna auto “Fiat”, la targa dell’auto ed il numero di sinistri in cui è stata coinvolta*/
SELECT a.Targa, COUNT(*) AS NumeroSinistri
FROM Automobili a, Autocoinvolte ac
WHERE a.Marca = 'FIAT'
AND a.Targa = ac.Targa
GROUP BY a.Targa, ac.CodS

/*7- Per ciascuna auto coinvolta in più di un sinistro, la targa dell’auto, il nome dell’ Assicurazione ed il totale dei danni riportati*/
SELECT a.Targa, ass.Nome, SUM(ac.ImportoDelDanno) AS TotaleDanni
FROM Automobili a, Assicurazioni ass, Autocoinvolte ac
WHERE a.CodAss = ass.CodAss
AND a.Targa = ac.Targa
GROUP BY a.Targa, ass.Nome, ac.Targa
HAVING COUNT(*) > 1

/*8- CodF e Nome di coloro che possiedono più di un’auto*/
SELECT p.CodF, p.Nome
FROM Proprietari p, Automobili a
WHERE p.CodF = a.CodF
GROUP BY p.CodF, p.Nome
HAVING COUNT(*) > 1

/*9- La targa delle auto che non sono state coinvolte in sinistri dopo il 20/01/01*/
SELECT a.Targa
FROM Automobili a
WHERE NOT EXISTS(SELECT * 
				 FROM Autocoinvolte ac, Sinistri s
				 WHERE a.Targa = ac.Targa
				 AND ac.CodS = s.CodS
				 AND s.Giorno > '2001-01-20')

/*10- Il codice dei sinistri in cui non sono state coinvolte auto con cilindrata inferiore a 2000 cc*/
SELECT s.CodS
FROM Automobili a, Autocoinvolte ac, Sinistri s
WHERE a.Targa = ac.Targa
AND ac.CodS = s.CodS
AND a.Cilindrata > 2000