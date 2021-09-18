SELECT * 
FROM Impiegato
WHERE eta>50;

SELECT * 
FROM Acquisto
WHERE item=2;

SELECT nome,titolo,salario
FROM Impiegato
WHERE salario>1400
AND titolo='Programmatore';


SELECT nome
FROM Impiegato
WHERE titolo='Programmatore'
OR titolo='Analista';


SELECT DISTINCT eta
FROM Impiegato


SELECT AVG(salario)
FROM Impiegato


SELECT *
FROM Impiegato
ORDER BY salario DESC

SELECT *
FROM Impiegato
ORDER BY salario DESC, eta DESC


SELECT *
FROM Impiegato
/*WHERE nome='Marta' si può fare in tutti e due i modi
OR nome='Fabio'
OR nome='Ivan'*/
WHERE nome IN('Marta','Fabio','Ivan')


SELECT *
FROM Impiegato
WHERE nome NOT IN('Marta','Fabio','Ivan')


SELECT *
FROM Impiegato
WHERE eta BETWEEN 20 AND 30


SELECT c.nome, a.prezzo
FROM Acquisto a, Cliente c
WHERE a.idCliente = c.IdCiente