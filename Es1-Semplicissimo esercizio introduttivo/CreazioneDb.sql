INSERT INTO Cliente(nome,cognome,citta,stato)
VALUES('Alberto','Tomba','Pinerolo','IT'),
('Paperino','Pape','Fossano','IT'),
('Alberto','Barbero','Mondovì','IT');

INSERT INTO Impiegato VALUES
('Edoardo','',18,1500,'s'),
('Ivan','',20,1200,'s'),
('Marta','',19,1300,'s');

INSERT INTO Acquisto(idCliente, dataOrdinazione,item,quantita,prezzo)
VALUES(1,'2000-12-20',1,3,50),
(1,'2020-05-03',2,4,34),
(1,'2016-11-28',4,5,23);
