SELECT *
FROM Continenti c, Nazioni n
WHERE c.Id=CodContinente

SELECT *
FROM Continenti c INNER JOIN Nazioni n ON c.Id=CodContinente

SELECT *
FROM Continenti c LEFT JOIN Nazioni n ON c.Id=CodContinente