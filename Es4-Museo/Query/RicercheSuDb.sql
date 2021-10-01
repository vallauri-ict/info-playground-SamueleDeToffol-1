/* Per ciascun museo di Londra il numero di opere di artisti italiani ivi conservati*/
SELECT m.NomeM, count(*) as NumeroOpere
FROM Artista a, Museo m, Opera o
WHERE a.Nazionalita = 'IT'
AND a.NomeA = o.NomeA 
AND m.NomeM = o.NomeM
AND m.Citta = 'Londra'
GROUP BY m.NomeM

/*Il nome di musei di Londra che non conservano opere di Tiziano*/
SELECT m.NomeM
FROM Museo m
WHERE m.Citta = 'Londra'
AND NOT EXISTS (SELECT * FROM Opera o WHERE o.NomeA = 'Tiziano' AND o.NomeM = m.NomeM)