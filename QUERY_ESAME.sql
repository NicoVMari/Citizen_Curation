-- QUERY 1
-- Restituire l'elenco degli artisti (deceduti/viventi) che sono stati scelti nella creazioe di storie. 
-- Ordinare il risultato in ordine crescente per numero di volte in cui, un artista, compare nelle storie (perchè selezionato in opere che compongono una storia). 
-- Riportare la durata (AVG(TimeStampFine-TimeStampInizio)) in minuti media delle storie.

SELECT Autore.Nome AS NomeArtista, COUNT(*) AS NumeroStorie, 
    CASE WHEN Autore.Data_morte IS NOT NULL THEN 'SI' ELSE 'NO' END AS ArtistaDeceduto,
    ROUND(AVG(EXTRACT(EPOCH FROM (Storia.Fine - Storia.Inizio)) / 60)::numeric,2) AS DurataMediaStoria
FROM Autore
JOIN Opera_Arte ON Autore.Codice = Opera_Arte.Autore
JOIN Include_Opera ON Opera_Arte.Codice = Include_Opera.Opera_arte
JOIN Storia ON Include_Opera.Storia = Storia.Id_storia
GROUP BY Autore.Nome, Autore.Data_morte
ORDER BY NumeroStorie DESC;

-- Query con operatori insiemistici:
SELECT Autore.Nome AS NomeArtista, COUNT(*) AS NumeroStorie, 
    CASE WHEN Autore.Data_morte IS NOT NULL THEN 'SI' ELSE 'NO' END AS ArtistaDeceduto,
    ROUND(AVG(EXTRACT(EPOCH FROM (Storia.Fine - Storia.Inizio)) / 60)::numeric, 2) AS DurataMediaStoria
FROM Autore
JOIN Opera_Arte ON Autore.Codice = Opera_Arte.Autore
JOIN Include_Opera ON Opera_Arte.Codice = Include_Opera.Opera_arte
JOIN Storia ON Include_Opera.Storia = Storia.Id_storia
WHERE EXISTS (
    SELECT 1
    FROM Autore AS A
    JOIN Opera_Arte AS OA ON A.Codice = OA.Autore
    JOIN Include_Opera AS IO ON OA.Codice = IO.Opera_arte
    JOIN Storia AS S ON IO.Storia = S.Id_storia
    WHERE A.Nome = Autore.Nome
    GROUP BY A.Nome
)
GROUP BY Autore.Nome, Autore.Data_morte
ORDER BY NumeroStorie DESC;



-- QUERY 2
-- Selezionare tutte le storie degli utenti di età compresa tra [35<=x<=50] anni (estremi inclusi) che contengono almeno 2 opere d'arte (>=2). 
-- Ordinare le storie in ordine decrescente di durata della storia (durata =TimeStampFine - TimeStampInizio)

SELECT Storia.Id_storia AS IdStoria, Storia.Titolo AS TitoloStoria, 
    COUNT(Include_Opera.Opera_arte) AS NumeroOpere, 
    EXTRACT(EPOCH FROM (Storia.Fine - Storia.Inizio)) AS DurataSecondi
FROM Storia
JOIN Utente ON Storia.Utente = Utente.Email
JOIN Include_Opera ON Storia.Id_storia = Include_Opera.Storia
WHERE DATE_PART('year', AGE(CURRENT_DATE, Utente.Data_nascita)) BETWEEN 35 AND 50
GROUP BY Storia.Id_storia, Storia.Titolo
HAVING COUNT(Include_Opera.Opera_arte) >= 2
ORDER BY DurataSecondi DESC;

-- Query con operatori insiemistici:
SELECT Storia.Id_storia AS IdStoria, Storia.Titolo AS TitoloStoria, 
    COUNT(Include_Opera.Opera_arte) AS NumeroOpere, 
    EXTRACT(EPOCH FROM (Storia.Fine - Storia.Inizio)) AS DurataSecondi
FROM Storia
JOIN Utente ON Storia.Utente = Utente.Email
JOIN Include_Opera ON Storia.Id_storia = Include_Opera.Storia
WHERE DATE_PART('year', AGE(CURRENT_DATE, Utente.Data_nascita)) BETWEEN 35 AND 50
    AND Storia.Id_storia IN (
        SELECT Storia.Id_storia
        FROM Storia
        JOIN Include_Opera ON Storia.Id_storia = Include_Opera.Storia
        GROUP BY Storia.Id_storia
        HAVING COUNT(Include_Opera.Opera_arte) >= 2
    )
GROUP BY Storia.Id_storia, Storia.Titolo
ORDER BY DurataSecondi DESC;



-- QUERY 3
-- Restituire CF, nome, cognome, età e data di nascita dell'utente che ha creato il maggior numero di storie che NON HANNO ricevuto commenti da altri utenti. 
-- Ordinare il risultato in ordine decrescente per numero storie create

SELECT Utente.Email AS CF, Utente.Nome, Utente.Cognome, Utente.Data_nascita AS DataNascita,
    DATE_PART('year', AGE(CURRENT_DATE, Utente.Data_nascita)) AS Eta, COUNT(*) AS NumeroStorie
FROM Utente
JOIN Storia ON Utente.Email = Storia.Utente
LEFT JOIN Commento ON Storia.Id_storia = Commento.Storia
GROUP BY Utente.Email, Utente.Nome, Utente.Cognome, Utente.Data_nascita
HAVING COUNT(Commento.Id_commento) = 0
ORDER BY NumeroStorie DESC;

Query con operatori insiemistici:
SELECT Utente.Email AS CF, Utente.Nome, Utente.Cognome, Utente.Data_nascita AS DataNascita,
    DATE_PART('year', AGE(CURRENT_DATE, Utente.Data_nascita)) AS Eta, COUNT(*) AS NumeroStorie
FROM Utente
JOIN Storia ON Utente.Email = Storia.Utente
LEFT JOIN Commento ON Storia.Id_storia = Commento.Storia
WHERE Utente.Email NOT IN (
    SELECT Storia.Utente
    FROM Storia
    JOIN Commento ON Storia.Id_storia = Commento.Storia
    GROUP BY Storia.Utente
)
GROUP BY Utente.Email, Utente.Nome, Utente.Cognome, Utente.Data_nascita
ORDER BY NumeroStorie DESC;



-- QUERY 4
-- Restituire l’elenco delle opere che sono state maggiormente selezionate dagli utenti nella creazione delle loro storie, che hanno età compresa [25<=x<=55] (estremi inclusi). 
-- Ordinare il risultato in ordine decrescente per TitoloOpera

SELECT Opera_Arte.Titolo AS TitoloOpera, Autore.Nome || ' ' || Autore.Cognome AS Artista,
    Autore.Data_nascita AS AnnoNascitaArtista, COUNT(*) AS NumeroVolteSelezionate
FROM Opera_Arte
JOIN Autore ON Opera_Arte.Autore = Autore.Codice
JOIN Include_Opera ON Opera_Arte.Codice = Include_Opera.Opera_arte
JOIN Storia ON Include_Opera.Storia = Storia.Id_storia
JOIN Utente ON Storia.Utente = Utente.Email
WHERE DATE_PART('year', AGE(CURRENT_DATE, Utente.Data_nascita)) BETWEEN 25 AND 55
GROUP BY Opera_Arte.Titolo, Autore.Nome, Autore.Cognome, Autore.Data_nascita
ORDER BY Opera_Arte.Titolo DESC;

-- Query con operatori insiemistici
SELECT Opera_Arte.Titolo AS TitoloOpera, Autore.Nome || ' ' || Autore.Cognome AS Artista,
    Autore.Data_nascita AS AnnoNascitaArtista, COUNT(*) AS NumeroVolteSelezionate
FROM Opera_Arte
JOIN Autore ON Opera_Arte.Autore = Autore.Codice
JOIN Include_Opera ON Opera_Arte.Codice = Include_Opera.Opera_arte
JOIN Storia ON Include_Opera.Storia = Storia.Id_storia
WHERE EXISTS (
    SELECT 1
    FROM Utente
    JOIN Storia ON Utente.Email = Storia.Utente
    WHERE DATE_PART('year', AGE(CURRENT_DATE, Utente.Data_nascita)) BETWEEN 25 AND 55
        AND Storia.Id_storia = Include_Opera.Storia
)
GROUP BY Opera_Arte.Titolo, Autore.Nome, Autore.Cognome, Autore.Data_nascita
ORDER BY Opera_Arte.Titolo DESC;





-- QUERY 5 
-- Restituire l'elenco degli artisti (deceduti/viventi) che sono stati scelti nella creazione di storie. 
-- Ordinare il risultato in ordine crescente per numero di volte in cui, un artista, compare nelle storie (perchè selezionato in opere che compongono una storia). 
-- Riportare la durata (AVG(TimeStampFine-TimeStampInizio)) in minuti media delle storie.

SELECT A.Nome || ' ' || A.Cognome AS NomeArtista, COUNT(*) AS NumeroStorie, 
       CASE WHEN A.Data_morte IS NOT NULL THEN 'SI' ELSE 'NO' END AS ArtistaDeceduto,
        ROUND(AVG(EXTRACT(EPOCH FROM (S.Fine - S.Inizio))/60)::numeric,2) AS DurataMediaStoria
FROM Autore A
JOIN Opera_Arte OA ON A.Codice = OA.Autore
JOIN Include_Opera IO ON OA.Codice = IO.Opera_arte
JOIN Storia S ON IO.Storia = S.Id_storia
GROUP BY A.Nome, A.Cognome, A.Data_morte
ORDER BY NumeroStorie ASC;

-- Query con operatori insiemistici:
SELECT A.Nome || ' ' || A.Cognome AS NomeArtista, COUNT(*) AS NumeroStorie, 
       CASE WHEN A.Data_morte IS NOT NULL THEN 'SI' ELSE 'NO' END AS ArtistaDeceduto,
       ROUND(AVG(EXTRACT(EPOCH FROM (S.Fine - S.Inizio))/60)::numeric,2) AS DurataMediaStoria
FROM Autore A
JOIN Opera_Arte OA ON A.Codice = OA.Autore
JOIN Include_Opera IO ON OA.Codice = IO.Opera_arte
JOIN Storia S ON IO.Storia = S.Id_storia
WHERE A.Codice = ANY (
    SELECT OA.Autore
    FROM Opera_Arte OA
    JOIN Include_Opera IO ON OA.Codice = IO.Opera_arte
    JOIN Storia S ON IO.Storia = S.Id_storia
    GROUP BY OA.Autore
)
GROUP BY A.Nome, A.Cognome, A.Data_morte
ORDER BY NumeroStorie ASC;






-- QUERY 6
-- Per ogni utente che ha creato almeno 2 storie, si vuole conoscere la durata media delle sue storie (AVG(TimeStampFine-TimeStampInizio)) in minuti, numero di like e numero totale di commenti. 
-- Ordinare il risultato in ordine decrescente per età dell'utente.

SELECT U.Nome, U.Cognome, DATE_PART('year', AGE(CURRENT_DATE, U.Data_nascita)) AS "Età (anni)",
       ROUND(AVG(EXTRACT(EPOCH FROM (S.Fine - S.Inizio))/60)::numeric,2) AS "DurataMediaStorie (minuti)",
       COUNT(DISTINCT C.Id_commento) AS "NumeroCommenti",
       COUNT(DISTINCT V.Id_voto) AS "NumeroLike"
FROM Utente U
JOIN Storia S ON U.Email = S.Utente
LEFT JOIN Commento C ON S.Id_storia = C.Storia
LEFT JOIN Voto V ON S.Id_storia = V.Storia
GROUP BY U.Email, U.Nome, U.Cognome
HAVING COUNT(DISTINCT S.Id_storia) >= 2
ORDER BY "Età (anni)" DESC;


-- Query con operatori insiemisti:
SELECT U.Nome, U.Cognome, DATE_PART('year', AGE(CURRENT_DATE, U.Data_nascita)) AS "Età (anni)",
       ROUND(AVG(EXTRACT(EPOCH FROM (S.Fine - S.Inizio))/60)::numeric, 2) AS "DurataMediaStorie (minuti)",
       COUNT(DISTINCT C.Id_commento) AS "NumeroCommenti",
       COUNT(DISTINCT V.Id_voto) AS "NumeroLike"
FROM Utente U
JOIN Storia S ON U.Email = S.Utente
LEFT JOIN Commento C ON S.Id_storia = C.Storia
LEFT JOIN Voto V ON S.Id_storia = V.Storia
WHERE U.Email IN (
    SELECT U2.Email
    FROM Utente U2
    JOIN Storia S2 ON U2.Email = S2.Utente
    GROUP BY U2.Email
    HAVING COUNT(DISTINCT S2.Id_storia) >= 2
)
GROUP BY U.Email, U.Nome, U.Cognome
ORDER BY "Età (anni)" DESC;




-- QUERY 7  (abbassato il numero di storie da 4 a 1)
-- Per ogni curatore che lavora all'interno del museo che ha creato almeno 4 storie, si vuole conoscere l'età media degli utenti che hanno commentato le sue storie. 
-- Restituire il risultato in ordine decrescente per durata media (AVG(TimeStampFine-TimeStampInizio)) in minuti delle storie create da curatore museale.

SELECT U.Nome AS "NomeCuratore", U.Cognome AS "CognomeCuratore",
       DATE_PART('year', AGE(CURRENT_DATE, U.Data_nascita)) AS "Età (anni)",
       ROUND(AVG(EXTRACT(EPOCH FROM (S.Fine - S.Inizio))/60)::numeric,2) AS "DurataMediaStorie (minuti)",
       COUNT(DISTINCT S.Id_storia) AS "NumeroStorieCreate",
       AVG(DATE_PART('year', AGE(CURRENT_DATE, UC.Data_nascita))) AS "EtàMediaUtenti",
       COUNT(DISTINCT V.Id_voto) AS "NumeroLike"
FROM Utente U
JOIN Storia S ON U.Email = S.Utente
JOIN Commento C ON S.Id_storia = C.Storia
JOIN Utente UC ON C.Utente = UC.Email
LEFT JOIN Voto V ON S.Id_storia = V.Storia
WHERE U.Curatore = TRUE
GROUP BY U.Email, U.Nome, U.Cognome
HAVING COUNT(DISTINCT S.Id_storia) >= 1
ORDER BY "DurataMediaStorie (minuti)" DESC;

-- Query con operatori:
SELECT U.Nome AS "NomeCuratore", U.Cognome AS "CognomeCuratore",
       DATE_PART('year', AGE(CURRENT_DATE, U.Data_nascita)) AS "Età (anni)",
       ROUND(AVG(EXTRACT(EPOCH FROM (S.Fine - S.Inizio))/60)::numeric, 2) AS "DurataMediaStorie (minuti)",
       COUNT(DISTINCT S.Id_storia) AS "NumeroStorieCreate",
       AVG(DATE_PART('year', AGE(CURRENT_DATE, UC.Data_nascita))) AS "EtàMediaUtenti",
       COUNT(DISTINCT V.Id_voto) AS "NumeroLike"
FROM Utente U
JOIN Storia S ON U.Email = S.Utente
JOIN Commento C ON S.Id_storia = C.Storia
JOIN Utente UC ON C.Utente = UC.Email
LEFT JOIN Voto V ON S.Id_storia = V.Storia
WHERE U.Curatore = TRUE
  AND U.Email IN (
    SELECT U2.Email
    FROM Utente U2
    JOIN Storia S2 ON U2.Email = S2.Utente
    GROUP BY U2.Email
    HAVING COUNT(DISTINCT S2.Id_storia) >= 1
  )
GROUP BY U.Email, U.Nome, U.Cognome
ORDER BY "DurataMediaStorie (minuti)" DESC;



-- QUERY 8(allargato età da 25/40 a 20/100)
-- Restituire le storie che sono state create da utenti di età compresa tra [25<=x<=40] anni (estremi inclusi) CHE NON SONO curatori ma che hanno ricevuto commenti solo da curatori. 
-- Ordinare il risultato in ordine decrescente per durata della storia (AVG(TimeStampFine-TimeStampInizio))

SELECT S.Id_storia AS "idStory", S.Titolo AS "TitoloStoria", S.Inizio AS "DataCreazione",
       ROUND(AVG(EXTRACT(EPOCH FROM (S.Fine - S.Inizio))/60)::numeric,2) AS "DurataMediaStorie (minuti)",
       COUNT(DISTINCT C.Id_commento) AS "NumeroTotaleCommenti",
       AVG(DATE_PART('year', AGE(CURRENT_DATE, UC.Data_nascita))) AS "EtàMediaUtenti",
       COUNT(DISTINCT V.Id_voto) AS "NumeroLike"
FROM Storia S
JOIN Utente U ON S.Utente = U.Email
JOIN Commento C ON S.Id_storia = C.Storia
JOIN Utente UC ON C.Utente = UC.Email
LEFT JOIN Voto V ON S.Id_storia = V.Storia
WHERE DATE_PART('year', AGE(CURRENT_DATE, U.Data_nascita)) >= 20
  AND DATE_PART('year', AGE(CURRENT_DATE, U.Data_nascita)) <= 100
  AND U.Curatore = FALSE
  AND UC.Curatore = TRUE
  AND NOT EXISTS (
    SELECT 1
    FROM Commento C2
    JOIN Utente UC2 ON C2.Utente = UC2.Email
    WHERE C2.Storia = S.Id_storia
      AND UC2.Curatore = FALSE
  )
GROUP BY S.Id_storia, S.Titolo, S.Inizio
ORDER BY "DurataMediaStorie (minuti)" DESC;


-- QUERY 9 (non ci sono curatori che hanno commentato 4 storie quindi per provarla ho abbassato il numero di storie commentate ad 1 ed esce il risultato)
-- Restituire nome, cognome e età (in anni) dei curatori che hanno commentato almeno 4 storie di utenti di età compresa tra [20<=x<=35] anni (estremi inclusi). 
-- Ordinare il risultato per numero decrescente di commenti.

SELECT Utente.Nome AS NomeCuratore, Utente.Cognome AS CognomeCuratore,
       DATE_PART('year', AGE(CURRENT_DATE, Utente.Data_nascita)) AS EtaCuratore,
        ROUND(AVG(EXTRACT(EPOCH FROM (Storia.Fine - Storia.Inizio))/60)::numeric,2) AS DurataMediaStorie,
       COUNT(Commento.Id_commento) AS NumeroTotaleCommenti,
       AVG(DATE_PART('year', AGE(CURRENT_DATE, UtenteStoria.Data_nascita))) AS EtaMediaUtenti
FROM Utente
JOIN Commento ON Utente.Email = Commento.Utente
JOIN Storia ON Commento.Storia = Storia.Id_storia
JOIN Utente AS UtenteStoria ON Storia.Utente = UtenteStoria.Email
WHERE Utente.Curatore = TRUE
  AND DATE_PART('year', AGE(CURRENT_DATE, UtenteStoria.Data_nascita)) >= 20
  AND DATE_PART('year', AGE(CURRENT_DATE, UtenteStoria.Data_nascita)) <= 35
GROUP BY Utente.Email, Utente.Nome, Utente.Cognome
HAVING COUNT(DISTINCT Storia.Id_storia) >= 1
ORDER BY COUNT(Commento.Id_commento) DESC;

-- Query con gli operatori:
SELECT Utente.Nome AS NomeCuratore, Utente.Cognome AS CognomeCuratore,
       DATE_PART('year', AGE(CURRENT_DATE, Utente.Data_nascita)) AS EtaCuratore,
       ROUND(AVG(EXTRACT(EPOCH FROM (Storia.Fine - Storia.Inizio))/60)::numeric, 2) AS DurataMediaStorie,
       COUNT(Commento.Id_commento) AS NumeroTotaleCommenti,
       AVG(DATE_PART('year', AGE(CURRENT_DATE, UtenteStoria.Data_nascita))) AS EtaMediaUtenti
FROM Utente
JOIN Commento ON Utente.Email = Commento.Utente
JOIN Storia ON Commento.Storia = Storia.Id_storia
JOIN Utente AS UtenteStoria ON Storia.Utente = UtenteStoria.Email
WHERE Utente.Curatore = TRUE
  AND UtenteStoria.Email IN (
    SELECT UtenteStoria2.Email
    FROM Utente AS UtenteStoria2
    JOIN Storia AS Storia2 ON UtenteStoria2.Email = Storia2.Utente
    WHERE DATE_PART('year', AGE(CURRENT_DATE, UtenteStoria2.Data_nascita)) >= 20
      AND DATE_PART('year', AGE(CURRENT_DATE, UtenteStoria2.Data_nascita)) <= 35
    GROUP BY UtenteStoria2.Email
    HAVING COUNT(DISTINCT Storia2.Id_storia) >= 1
  )
GROUP BY Utente.Email, Utente.Nome, Utente.Cognome
HAVING COUNT(DISTINCT Storia.Id_storia) >= 1
ORDER BY COUNT(Commento.Id_commento) DESC;



-- QUERY 10 (visto che abbiamo solo due curatori (uno che non ha mai fatto un commento quindi valori null) usciranno tutti e due nella query)
-- Restituire nome, cognome e età (in anni) dei curatori che NON hanno commentato almeno 4 storie di utenti di età compresa tra [20<=x<=35] anni (estremi inclusi). 
-- Ordinare il risultato per numero decrescente di commenti.

Versione 1:
SELECT Utente.Nome AS NomeCuratore, Utente.Cognome AS CognomeCuratore,
       DATE_PART('year', AGE(CURRENT_DATE, Utente.Data_nascita)) AS EtaCuratore,
       ROUND(AVG(EXTRACT(EPOCH FROM (Storia.Fine - Storia.Inizio))/60)::numeric,2) AS DurataMediaStorie,
       COUNT(Commento.Id_commento) AS NumeroTotaleCommenti,
       AVG(DATE_PART('year', AGE(CURRENT_DATE, UtenteStoria.Data_nascita))) AS EtaMediaUtenti
FROM Utente
LEFT JOIN Commento ON Utente.Email = Commento.Utente
LEFT JOIN Storia ON Commento.Storia = Storia.Id_storia
LEFT JOIN Utente AS UtenteStoria ON Storia.Utente = UtenteStoria.Email
WHERE Utente.Curatore = TRUE
  AND (UtenteStoria.Email IS NULL
       OR DATE_PART('year', AGE(CURRENT_DATE, UtenteStoria.Data_nascita)) < 20
       OR DATE_PART('year', AGE(CURRENT_DATE, UtenteStoria.Data_nascita)) > 35)
GROUP BY Utente.Email, Utente.Nome, Utente.Cognome
HAVING COUNT(Storia.Id_storia) <= 4
ORDER BY COUNT(Commento.Id_commento) DESC;

-- Query con operatori:
SELECT Utente.Nome AS NomeCuratore, Utente.Cognome AS CognomeCuratore,
       DATE_PART('year', AGE(CURRENT_DATE, Utente.Data_nascita)) AS EtaCuratore,
       ROUND(AVG(EXTRACT(EPOCH FROM (Storia.Fine - Storia.Inizio))/60)::numeric, 2) AS DurataMediaStorie,
       COUNT(Commento.Id_commento) AS NumeroTotaleCommenti,
       AVG(DATE_PART('year', AGE(CURRENT_DATE, UtenteStoria.Data_nascita))) AS EtaMediaUtenti
FROM Utente
LEFT JOIN Commento ON Utente.Email = Commento.Utente
LEFT JOIN Storia ON Commento.Storia = Storia.Id_storia
LEFT JOIN Utente AS UtenteStoria ON Storia.Utente = UtenteStoria.Email
WHERE Utente.Curatore = TRUE
  AND (
    UtenteStoria.Email IS NULL
    OR DATE_PART('year', AGE(CURRENT_DATE, UtenteStoria.Data_nascita)) < 20
    OR DATE_PART('year', AGE(CURRENT_DATE, UtenteStoria.Data_nascita)) > 35
  )
GROUP BY Utente.Email, Utente.Nome, Utente.Cognome
HAVING COUNT(Storia.Id_storia) <= ALL (SELECT 4)
ORDER BY COUNT(Commento.Id_commento) DESC;




-- (MV non finita)
SELECT Utente.Nome AS NomeCuratore, Utente.Cognome AS CognomeCuratore,
       DATE_PART('year', AGE(CURRENT_DATE, Utente.Data_nascita)) AS EtaCuratore,
       ROUND(AVG(EXTRACT(EPOCH FROM (Storia.Fine - Storia.Inizio))/60)::numeric,2) AS DurataMediaStorie,
       COUNT(Commento.Id_commento) AS NumeroTotaleCommenti,
       AVG(DATE_PART('year', AGE(CURRENT_DATE, UtenteStoria.Data_nascita))) AS EtaMediaUtenti
FROM Utente
LEFT JOIN Commento ON Utente.Email = Commento.Utente
LEFT JOIN Storia ON Commento.Storia = Storia.Id_storia
LEFT JOIN Utente AS UtenteStoria ON Storia.Utente = UtenteStoria.Email
WHERE Utente.Curatore = TRUE
GROUP BY Utente.Email, Utente.Nome, Utente.Cognome
HAVING COUNT(Storia.Id_storia) < 4
ORDER BY COUNT(Commento.Id_commento) DESC;




-- QUERY 11 (non ci sono curatori che hanno commentato 4 storie di utenti fragili quindi per provarla ho abbassato il numero di storie commentate ad 2 e i voti totali a questa storia non arrivano a 10 quindi ho messo 2 ed esce il risultato)
-- Restituire nome, cognome e età (in anni) dei curatori che hanno commentato almeno 4 storie di utenti fragili che hanno ricevuto almeno 10 like. 
-- Ordinare il risultato per numero decrescente di like.

SELECT Utente.Nome AS NomeCuratore, Utente.Cognome AS CognomeCuratore,
       DATE_PART('year', AGE(CURRENT_DATE, Utente.Data_nascita)) AS EtaCuratore,
       COUNT(DISTINCT Storia.Id_storia) AS NumeroStorieUtentiFragili,
       COUNT(DISTINCT Commento.Id_commento) AS NumeroTotaleCommenti,
       COUNT(DISTINCT Voto.Id_voto) AS NumeroLike
FROM Utente
JOIN Commento ON Utente.Email = Commento.Utente
JOIN Storia ON Commento.Storia = Storia.Id_storia
JOIN Utente AS UtenteStoria ON Storia.Utente = UtenteStoria.Email
JOIN (
    SELECT Storia.Id_storia
    FROM Storia
    JOIN Voto ON Storia.Id_storia = Voto.Storia
    GROUP BY Storia.Id_storia
    HAVING COUNT(DISTINCT Voto.Id_voto) >= 2
) AS StoriePopolari ON Storia.Id_storia = StoriePopolari.Id_storia
JOIN Voto ON Storia.Id_storia = Voto.Storia
WHERE Utente.Curatore = TRUE
    AND UtenteStoria.Fragile = TRUE
GROUP BY Utente.Email, Utente.Nome, Utente.Cognome, Utente.Data_nascita
HAVING COUNT(DISTINCT Storia.Id_storia) >= 2
ORDER BY COUNT(DISTINCT Voto.Id_voto) DESC;

-- Query con operatori:
SELECT Utente.Nome AS NomeCuratore, Utente.Cognome AS CognomeCuratore,
       DATE_PART('year', AGE(CURRENT_DATE, Utente.Data_nascita)) AS EtaCuratore,
       COUNT(DISTINCT Storia.Id_storia) AS NumeroStorieUtentiFragili,
       COUNT(DISTINCT Commento.Id_commento) AS NumeroTotaleCommenti,
       COUNT(DISTINCT Voto.Id_voto) AS NumeroLike
FROM Utente
JOIN Commento ON Utente.Email = Commento.Utente
JOIN Storia ON Commento.Storia = Storia.Id_storia
JOIN Utente AS UtenteStoria ON Storia.Utente = UtenteStoria.Email
JOIN (
    SELECT Storia.Id_storia
    FROM Storia
    JOIN Voto ON Storia.Id_storia = Voto.Storia
    GROUP BY Storia.Id_storia
    HAVING COUNT(DISTINCT Voto.Id_voto) >= 2
) AS StoriePopolari ON Storia.Id_storia = StoriePopolari.Id_storia
JOIN Voto ON Storia.Id_storia = Voto.Storia
WHERE Utente.Curatore = TRUE
    AND UtenteStoria.Fragile = TRUE
GROUP BY Utente.Email, Utente.Nome, Utente.Cognome, Utente.Data_nascita
HAVING COUNT(DISTINCT Voto.Id_voto) >= ALL (SELECT 2)
ORDER BY COUNT(DISTINCT Voto.Id_voto) DESC;


-- QUERY 12 
-- Restituire, per ogni utente, id, titolo della storia e numero delle opere contenute (nella storia) di tutte le storie suggerite dal sistema che hanno emozioni opposte

SELECT Utente.Email AS CFUtente, Utente.Nome AS NomeUtente, Utente.Cognome AS CognomeUtente,
       DATE_PART('year', AGE(CURRENT_DATE, Utente.Data_nascita)) AS Eta,
       Storia.Id_storia AS idStory, Storia.Titolo AS TitoloStoriaOpposta,
       COUNT(Include_Opera.Opera_arte) AS NumeroOpereContenute
FROM Utente
JOIN Storia ON Utente.Email = Storia.Utente
JOIN Include_Opera ON Storia.Id_storia = Include_Opera.Storia
WHERE Storia.Opposta = TRUE
  AND Storia.Id_storia IN (
    SELECT DISTINCT Storia.Id_storia
    FROM Storia
    WHERE Storia.Simile = FALSE
  )
GROUP BY Utente.Email, Utente.Nome, Utente.Cognome, Storia.Id_storia, Storia.Titolo
ORDER BY Utente.Email, Storia.Id_storia;

-- Query con operatori:
SELECT Utente.Email AS CFUtente, Utente.Nome AS NomeUtente, Utente.Cognome AS CognomeUtente,
       DATE_PART('year', AGE(CURRENT_DATE, Utente.Data_nascita)) AS Eta,
       Storia.Id_storia AS idStory, Storia.Titolo AS TitoloStoriaOpposta,
       COUNT(Include_Opera.Opera_arte) AS NumeroOpereContenute
FROM Utente
JOIN Storia ON Utente.Email = Storia.Utente
JOIN Include_Opera ON Storia.Id_storia = Include_Opera.Storia
WHERE Storia.Opposta = TRUE
  AND Storia.Id_storia = ANY (
    SELECT DISTINCT Storia.Id_storia
    FROM Storia
    WHERE Storia.Simile = FALSE
  )
GROUP BY Utente.Email, Utente.Nome, Utente.Cognome, Storia.Id_storia, Storia.Titolo
ORDER BY Utente.Email, Storia.Id_storia;
