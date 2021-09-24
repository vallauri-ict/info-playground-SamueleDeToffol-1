/*Le città da cui partono voli per Roma in ordine alfabetico*/

SELECT DISTINCT v.CittaPartenza
FROM Volo v
WHERE v.CittaArrivo = 'Roma'
ORDER BY v.CittaPartenza;

/*città con aeroporto dove non è noto il numero di piste*/

SELECT DISTINCT a.Citta
FROM Aeroporto a
WHERE NumPiste IS NULL;

/*Per ogni volo misto(sia merci che passeggeri) codice volo e dati di trasporto*/

SELECT v.IdVolo, a.QtaMerci, a.NumPasseggeri
FROM Aereo a, Volo v
WHERE a.TipoAereo = v.TipoAereo
AND a.QtaMerci>0
AND a.NumPasseggeri>0;

/*