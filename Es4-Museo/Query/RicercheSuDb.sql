 /*	Per ciascun museo di Londra, il numero di opere di artisti italiani	*/
SELECT m.NomeM, COUNT(*) as NumeroOpere
FROM Artista a, Museo m, Opera o
WHERE a.NomeA = o.nomeA
AND m.NomeM = o.NomeM
AND m.Citta = 'Londra'
AND a.Nazionalita = 'IT' GROUP BY m.NomeM;

/*	Il nome dei musei di Londra che non hanno opere di Tiziano	*/
SELECT m.NomeM
FROM Museo m
WHERE m.Citta = 'Londra'
AND NOT EXISTS(SELECT * FROM Opera o 
			   WHERE o.NomeA='Tiziano' 
			   AND o.NomeM = m.NomeM); --sempre legare le due query

--	Il nome dei musei di Londra che conservano solo opere di Tiziano
SELECT m.NomeM
FROM Museo m
WHERE m.Citta = 'Londra' AND NOT EXISTS
	(SELECT *
	FROM Opera O
	WHERE O.NomeA <> 'Tiziano'
	AND M.NomeM = O.NomeM)

--	Per ciascun artista, il nome dell’artista ed il numero di sue opere conservate alla Galleria degli Uffizi
SELECT O.NomeA, COUNT(*)
FROM Opera O
WHERE O.NomeM = 'Galleria degli Uffizi'
GROUP BY O.NomeA

--	I musei che conservano almeno 20 opere di artisti italiani

SELECT M.NomeM
FROM Museo M
WHERE (SELECT COUNT (*)
FROM Opera O, Artista A
WHERE a.Nazionalita = 'IT'
AND O.NomeA = A.NomeA AND O.NomeM=M.NomeM) >= 20;

-- Il titolo dell’opera ed il nome dell’artista delle opere di artisti italiani che non hanno personaggi
SELECT O.Titolo, A.NomeA
FROM Opera O, Artista A
WHERE O.NomeA=A.NomeA AND
A.Nazionalita = 'IT' AND
NOT EXISTS
( SELECT *
FROM Personaggio P
WHERE P.Codice=O.Codice)

-- Il nome dei musei di Londra che non conservano opere di artisti italiani, eccettuato Tiziano
SELECT M.NomeM
FROM Museo M
WHERE M.Citta = 'Londra' 
AND NOT EXISTS
(SELECT * FROM Opera O, Artista A
WHERE A.Nazionalita= 'IT'
AND M.NomeM = O.NomeM
AND A.NomeA <> 'Tiziano')

--Per ogni museo, il numero di opere divise per la Nazionalita dell’artisa
SELECT O.NomeM, A.Nazionalita, COUNT(*)
FROM Opera O, Artista A
WHERE O.NomeA = A.NomeA
GROUP BY O.NomeM, A.Nazionalita