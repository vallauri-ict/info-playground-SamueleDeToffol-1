/* Film Felini prodotti dopo 1960*/

SELECT Titolo
FROM Film
WHERE Regista = 'Fellini'
AND AnnoProduzione > 1960

/* Il titolo e la durata dei film di fantascienza giapponesi o francesi prodotti dopo il 1990 */

SELECT Titolo, Durata
FROM Film f
WHERE f.Genere = 'Fantascienza'
AND (f.Nazionalita = 'JP' OR f.Nazionalita = 'FR')
AND f.AnnoProduzione > 1990

/* Il titolo dei film di fantascienza giapponesi prodotti dopo il 1990 oppure francesi */

SELECT f.Titolo
FROM Film f
WHERE f.Genere = 'Fantascienza'
AND ((f.Nazionalita = 'JP' AND f.AnnoProduzione>1990) OR f.Nazionalita='FR')

/* I titolo dei film dello stesso regista di “Casablanca” */

SELECT Titolo
FROM Film
WHERE Regista = (
	SELECT Regista
	FROM Film
	WHERE Titolo = 'Casablanca')

/* Il titolo ed il genere dei film proiettati il giorno di Natale 2004 */

SELECT f.TITOLO, f.GENERE from Film f, Sala s, Proiezione p WHERE (f.CodFilm = p.CodFilm AND p.CodSala = s.CodSala) AND s.Citta='Napoli' AND p.DataProiezione='20041225';

/* I nomi delle sale di Napoli in cui il giorno di Natale 2004 è stato proiettato un film con R.Williams */

SELECT DISTINCT s.Nome
FROM Film f, Sala s, Proiezione p, Recita r
WHERE 
(f.CodFilm = p.CodFilm AND p.CodSala = s.CodSala AND r.CodFilm=f.CodFilm)
AND s.Citta='Napoli' AND p.DataProiezione='20041225'
AND r.CodAttore=(
	SELECT CodAttore
	FROM Attore
	WHERE Nome='Robin Williams');


/* Il titolo dei film in cui recitano M. Mastroianni e S.Loren */

SELECT f.Titolo
FROM Film f, Attore a, Recita r
WHERE f.CodFilm = r.CodFilm AND r.CodAttore = a.CodAttore
AND f.CodFilm IN (SELECT f.CodFilm
FROM Film f, Attore a, Recita r
WHERE f.CodFilm = r.CodFilm AND r.CodAttore = a.CodAttore
AND a.Nome = 'M. Mastroianni' )
AND a.Nome = 'Loren'


/* Per ogni film che è stato proiettato a Pisa nel gennaio 2005, il titolo del film e il nome della sala. */

SELECT f.Titolo
FROM Film f, Sala s, Proiezione p
WHERE f.CodFilm = p.CodFilm
AND p.CodSala = s.CodSala
AND s.Citta = 'Pisa'
AND p.DataProiezione BETWEEN '20050101' AND '20050131'