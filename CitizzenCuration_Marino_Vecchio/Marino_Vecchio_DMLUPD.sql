--  Aggiungi Utente

INSERT INTO Utente (Email, Genere, Data_nascita, Nome, Cognome, Fragile, Curatore)
VALUES ('AntonioGialli@example.com', 'Maschio', '1950-05-09', 'Antonio', 'Gialli', FALSE, FALSE);


--Aggiungi Storia

INSERT INTO Storia (Titolo, Inizio, Fine, Simile, Uguale, Opposta, Utente)
VALUES
('Storia 9', '2023-04-04 15:00:00', '2023-04-04 15:01:32', FALSE, TRUE, FALSE, 'AntonioGialli@example.com');



-- Aggiungi Commento

INSERT INTO Commento (Campo_Testo, Emoji, Hashtag, Storia, Utente)
VALUES ('Commento 10', '😊', '#bello', 9, 'AntonioGialli@example.com');


-- Elimina Commento

DELETE FROM Commento WHERE Id_commento = 10;



-- Aggiungi Annotazione

INSERT INTO Annotazione (Campo_testo, Emoji, Hashtag, Opera_arte, Utente)
VALUES ('Annotazione 9', '✏️', 'pittura', 5, 'AntonioGialli@example.com');


-- Elimina Annotazione

DELETE FROM Annotazione WHERE id_annotazione = 9;

--Aggiungi Gruppo

INSERT INTO Gruppo (Supervisore)
VALUES
    ('PieroCobalti@example.com');


-- Aggiorna Amministratore Gruppo

UPDATE Gruppo
SET Supervisore = 'AntonioGialli@example.com'
WHERE Supervisore = 'PieroCobalti@example.com';

-- Elimina Gruppo

DELETE  FROM Gruppo WHERE Supervisore = 'AntonioGialli@example.com'

--Aggiorna data_morte Autore

UPDATE Autore 
SET data_morte = '2023-07-03'
WHERE codice = '4';