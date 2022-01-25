SELECT Data 
FROM VenditeNegozio
UNION
SELECT Data 
FROM VenditeInternet
ORDER BY Data DESC

SELECT Data
FROM VenditeNegozio
INTERSECT
SELECT Data 
FROM VenditeInternet
