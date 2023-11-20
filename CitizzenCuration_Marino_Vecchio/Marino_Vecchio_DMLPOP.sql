INSERT INTO Utente (Email, Genere, Data_nascita, Nome, Cognome, Fragile, Curatore)
VALUES
    ('MarioRossi@example.com', 'Maschio', '1990-01-01', 'Mario', 'Rossi', FALSE, TRUE),
    ('SofiaCelesti@example.com', 'Femmina', '1993-09-14', 'Sofia', 'Celesti', FALSE, TRUE),
    ('AnnaVerdi@example.com', 'Femmina', '1995-05-10', 'Anna', 'Verdi', TRUE, FALSE),
    ('GennaroNeri@example.com', 'Maschio', '1944-06-11', 'Gennaro', 'Neri', TRUE, FALSE),
    ('GuidoRossi@example.com', 'Maschio', '1974-12-31', 'Guido', 'Rossi', FALSE, FALSE),
    ('LucaBianchi@example.com', 'Maschio', '1988-11-15', 'Luca', 'Bianchi', FALSE, FALSE),
    ('ChiaraGialli@example.com', 'Femmina', '2000-01-15', 'Chiara', 'Gialli', FALSE, FALSE),
    ('PieroCobalti@example.com', 'Maschio', '2002-01-5', 'Piero', 'Cobalti', FALSE, FALSE);



INSERT INTO Collezione_Museale (Nome)
VALUES
    ('Collezione 1'),
    ('Collezione 2'),
    ('Collezione 3'),
    ('Collezione 4'),
    ('Collezione 5');

INSERT INTO Autore (Data_nascita, Data_morte, Genere, Nome, Cognome, Stile_pittorico, Movimento_artistico)
VALUES
('1900-01-01','1950-05-10', 'Maschio', 'Nome Autore 1', 'Cognome Autore 1', 'Stile pittorico 1', 'Movimento artistico 1'),
('1935-04-12','1992-01-20', 'Maschio', 'Nome Autore 2', 'Cognome Autore 2', 'Stile pittorico 2', 'Movimento artistico 2'),
('1967-12-24', null, 'Femmina', 'Nome Autore 3', 'Cognome Autore 3', 'Stile pittorico 3', 'Movimento artistico 3'),
('1955-07-21', null, 'Maschio', 'Nome Autore 4', 'Cognome Autore 4', 'Stile pittorico 4','Movimento artistico 4'),
('1400-05-12','1480-05-10', 'Maschio', 'Nome Autore 5', 'Cognome Autore 5', 'Stile pittorico 5', 'Movimento artistico 5'),
('1970-12-01', null, 'Femmina', 'Nome Autore 6', 'Cognome Autore 6', 'Stile pittorico 6', 'Movimento artistico 6');

INSERT INTO Opera_Arte (Titolo, Descrizione, Anno_realizzazione, Materiale, Tecnica, Collezione_museale, Autore)
VALUES
    ('Opera 1', 'Descrizione opera 1', 1925, 'Materiale 1', 'Tecnica 1', 'Collezione 1', 1),
    ('Opera 2', 'Descrizione opera 2', 1967, 'Materiale 2', 'Tecnica 2', 'Collezione 2', 2),
    ('Opera 3', 'Descrizione opera 3', 1927, 'Materiale 3', 'Tecnica 3', 'Collezione 3', 1),
    ('Opera 4', 'Descrizione opera 4', 1990, 'Materiale 4', 'Tecnica 4', 'Collezione 4', 3),
    ('Opera 5', 'Descrizione opera 5', 1450, 'Materiale 5', 'Tecnica 5', 'Collezione 5', 5),
    ('Opera 6', 'Descrizione opera 6', 2000, 'Materiale 6', 'Tecnica 6', 'Collezione 1', 4),
    ('Opera 7', 'Descrizione opera 7', 1965, 'Materiale 7', 'Tecnica 7', 'Collezione 2', 2),
    ('Opera 8', 'Descrizione opera 8', 1968, 'Materiale 8', 'Tecnica 8', 'Collezione 3', 2),
    ('Opera 9', 'Descrizione opera 9', 2012, 'Materiale 9', 'Tecnica 9', 'Collezione 2', 6);



INSERT INTO Storia (Titolo, Inizio, Fine, Simile, Uguale, Opposta, Utente)
VALUES
('Storia 1', '2022-01-01 10:00:00', '2022-01-01 10:00:18', FALSE, TRUE, FALSE, 'LucaBianchi@example.com'),
('Storia 2', '2023-03-15 14:30:00', '2023-03-15 14:34:00', TRUE, FALSE, FALSE, 'ChiaraGialli@example.com'),
('Storia 3', '2023-05-20 09:00:00', '2023-05-20 09:00:55', FALSE, FALSE, TRUE, 'LucaBianchi@example.com'),
('Storia 4', '2023-03-12 11:00:00', '2023-03-12 11:07:32', FALSE, FALSE, TRUE, 'GuidoRossi@example.com'),
('Storia 5', '2023-01-25 20:00:00', '2023-01-25 20:00:34', FALSE, TRUE, FALSE, 'GennaroNeri@example.com'),
('Storia 6', '2023-04-03 14:00:00', '2023-04-03 14:00:47', TRUE, FALSE, FALSE, 'SofiaCelesti@example.com'),
('Storia 7', '2023-01-01 01:00:00', '2023-01-01 01:00:03', TRUE, FALSE, FALSE, 'AnnaVerdi@example.com'),
('Storia 8', '2023-01-01 12:00:00', '2023-01-01 12:00:53', TRUE, FALSE, FALSE, 'PieroCobalti@example.com');





INSERT INTO Voto (Punteggio, Storia, Utente)
VALUES
    (8, 1, 'MarioRossi@example.com'),
    (3, 2, 'AnnaVerdi@example.com'),
    (9, 5, 'LucaBianchi@example.com'),
    (7, 6, 'LucaBianchi@example.com'),
    (10, 7, 'ChiaraGialli@example.com'),
    (9, 4, 'AnnaVerdi@example.com'),
    (6, 1, 'GuidoRossi@example.com'),
    (9, 5, 'ChiaraGialli@example.com'),
    (4, 3, 'GennaroNeri@example.com'),
    (10, 1, 'AnnaVerdi@example.com'),
    (10, 4, 'MarioRossi@example.com'),
    (6, 7, 'GuidoRossi@example.com'),
    (7, 4, 'GennaroNeri@example.com'),
    (2, 2, 'GuidoRossi@example.com');
	

INSERT INTO Commento (Campo_Testo, Emoji, Hashtag, Storia, Utente)
VALUES
    ('Commento 1', '😊', '#arte', 1, 'MarioRossi@example.com'),
    ('Commento 2', '👍', '#museo', 2, 'LucaBianchi@example.com'),
    ('Commento 3', '😃', '#cultura', 3, 'GennaroNeri@example.com'),
    ('Commento 4', '👍', '#UAU', 6, 'GuidoRossi@example.com'),
    ('Commento 5', '😃', '#bello', 1, 'AnnaVerdi@example.com'),
    ('Commento 6', '👍', '#eccezionale', 4, 'LucaBianchi@example.com'),
    ('Commento 7', '😊', '#creativo', 2, 'AnnaVerdi@example.com'),
    ('Commento 8', '😃', '#bellissimo', 5, 'MarioRossi@example.com'),
    ('Commento 9', '😃', '#bellissimo', 7, 'MarioRossi@example.com');



INSERT INTO Annotazione (Campo_testo, Emoji, Hashtag, Opera_arte, Utente)
VALUES
    ('Annotazione 1', '✏️', 'pittura', 1, 'MarioRossi@example.com'),
    ('Annotazione 2', '📝', 'strana', 2, 'AnnaVerdi@example.com'),
    ('Annotazione 3', '🖌️', 'arte moderna', 3, 'GuidoRossi@example.com'),
    ('Annotazione 4', '📝', 'bucolica', 9, 'ChiaraGialli@example.com'),
    ('Annotazione 5', '🖌️', 'estasi', 5, 'GennaroNeri@example.com'),
    ('Annotazione 6', '✏️', 'passionale', 6, 'ChiaraGialli@example.com'),
    ('Annotazione 7', '🖌️', 'ermetista', 5, 'AnnaVerdi@example.com'),
    ('Annotazione 8', '✏️', 'arte moderna', 8, 'LucaBianchi@example.com');



INSERT INTO Gruppo (Supervisore)
VALUES
    ('GuidoRossi@example.com'),
    ('LucaBianchi@example.com'),
    ('ChiaraGialli@example.com');

INSERT INTO Partecipa (Email_partecipante, Email_supervisore)
VALUES
    ('SofiaCelesti@example.com', 'GuidoRossi@example.com'),
    ('MarioRossi@example.com', 'LucaBianchi@example.com'),
    ('GennaroNeri@example.com', 'ChiaraGialli@example.com');

INSERT INTO Consulta (Email_utente, Collezione_museale)
VALUES
    ('GuidoRossi@example.com', 'Collezione 1'),
    ('SofiaCelesti@example.com', 'Collezione 2'),
    ('LucaBianchi@example.com', 'Collezione 4'),
    ('AnnaVerdi@example.com', 'Collezione 5'),
    ('GuidoRossi@example.com', 'Collezione 3'),
    ('GennaroNeri@example.com', 'Collezione 3'),
    ('ChiaraGialli@example.com', 'Collezione 1');

INSERT INTO Aggiungi (Email_curatore, Autore)
VALUES
    ('MarioRossi@example.com', 1),
    ('MarioRossi@example.com', 2),
    ('SofiaCelesti@example.com', 3),
    ('SofiaCelesti@example.com', 4),
    ('SofiaCelesti@example.com', 5),
    ('MarioRossi@example.com', 6);


INSERT INTO Modifica (Email_curatore, Opera_arte)
VALUES
    ('MarioRossi@example.com', 1),
    ('SofiaCelesti@example.com', 2),
    ('SofiaCelesti@example.com', 9),
    ('MarioRossi@example.com', 8);
    

INSERT INTO Elimina (Email_curatore, Commento)
VALUES
    ('SofiaCelesti@example.com', 4);

INSERT INTO Include_Opera (Storia, Opera_arte)
VALUES
    (1, 4),
    (1, 3),
    (2, 1),
    (2, 2),
    (2, 9),
    (3, 5),
    (3, 1),
    (4, 2),
    (4, 1),
    (4, 3),
    (5, 3),
    (5, 2),
    (6, 8),
    (6, 6),
    (6, 5),
    (7, 9),
    (7, 4),
    (8,1),
    (8,2);




	

