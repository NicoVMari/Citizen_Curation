
CREATE TABLE Utente(
	Email VARCHAR(30) PRIMARY KEY NOT NULL UNIQUE,
	Genere VARCHAR(10) NOT NULL,
	Data_nascita DATE NOT NULL,
	Nome VARCHAR(20) NOT NULL,
	Cognome VARCHAR(20) NOT NULL,
	Fragile BOOLEAN DEFAULT FALSE,
	Curatore BOOLEAN DEFAULT FALSE
);

CREATE TABLE Storia(
	Id_storia SERIAL PRIMARY KEY,
	Titolo VARCHAR(20) NOT NULL,
	Inizio TIMESTAMP NOT NULL,
	Fine TIMESTAMP NOT NULL,
	Simile BOOLEAN DEFAULT FALSE,
	Uguale BOOLEAN DEFAULT FALSE,
	Opposta BOOLEAN DEFAULT FALSE,
	Utente VARCHAR(30),
	FOREIGN KEY (Utente) REFERENCES Utente(Email) ON DELETE SET NULL
);

CREATE TABLE Collezione_Museale(
	Nome VARCHAR(20) PRIMARY KEY NOT NULL UNIQUE
);

CREATE DOMAIN Dominio_Punteggio AS INTEGER
	CHECK(VALUE >= 1 AND VALUE <= 10);

CREATE TABLE Voto(
	Id_voto SERIAL PRIMARY KEY,
	Punteggio Dominio_Punteggio NOT NULL,
	Storia INTEGER,
	Utente VARCHAR(30),
	FOREIGN KEY (Storia) REFERENCES Storia(Id_storia) ON DELETE CASCADE,
	FOREIGN KEY (Utente) REFERENCES Utente(Email) ON DELETE SET NULL
);

CREATE TABLE Commento(
	Id_commento SERIAL PRIMARY KEY,
	Campo_Testo TEXT NOT NULL,
	Emoji VARCHAR(5) NOT NULL,
	Hashtag VARCHAR(20) NOT NULL,
	Storia INTEGER,
	Utente VARCHAR(30),
	FOREIGN KEY (Storia) REFERENCES Storia(Id_storia) ON DELETE CASCADE,
	FOREIGN KEY (Utente) REFERENCES Utente(Email) ON DELETE SET NULL
);

CREATE TABLE Autore(
	Codice SERIAL PRIMARY KEY,
	Data_nascita DATE NOT NULL,
	Data_morte DATE,
	Genere VARCHAR(10) NOT NULL,
	Nome VARCHAR(20) NOT NULL,
	Cognome VARCHAR(20) NOT NULL,
	Stile_pittorico VARCHAR(30) NOT NULL,
	Movimento_artistico VARCHAR(30) NOT NULL
);

CREATE TABLE Opera_Arte(
	Codice SERIAL PRIMARY KEY,
	Titolo VARCHAR(20) NOT NULL,
	Descrizione TEXT NOT NULL,
	Anno_realizzazione INTEGER NOT NULL,
	Materiale VARCHAR(15) NOT NULL,
	Tecnica VARCHAR(15) NOT NULL,
	Collezione_museale VARCHAR(20),
	Autore SERIAL,
	FOREIGN KEY (Collezione_museale) REFERENCES Collezione_Museale(Nome) ON DELETE CASCADE,
	FOREIGN KEY (Autore) REFERENCES Autore(Codice) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Annotazione(
	Id_annotazione SERIAL PRIMARY KEY,
	Campo_testo TEXT NOT NULL,
	Emoji VARCHAR(5),
	Hashtag VARCHAR(20),
	Opera_arte SERIAL,
	Utente VARCHAR(30),
	FOREIGN KEY (Opera_arte) REFERENCES Opera_Arte(Codice) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (Utente) REFERENCES Utente(Email) ON DELETE SET NULL
);

CREATE TABLE Gruppo(
	Supervisore VARCHAR(30) PRIMARY KEY,
	FOREIGN KEY (Supervisore) REFERENCES Utente(Email) ON DELETE CASCADE
);

CREATE TABLE Partecipa(
	Email_partecipante VARCHAR(30),
	Email_supervisore VARCHAR(30),
	FOREIGN KEY (Email_partecipante) REFERENCES Utente(Email) ON DELETE CASCADE,
	FOREIGN KEY (Email_supervisore) REFERENCES Gruppo(Supervisore) ON DELETE CASCADE
);

CREATE TABLE Consulta(
	Email_utente VARCHAR(30),
	Collezione_museale VARCHAR(20),
	FOREIGN KEY(Email_utente) REFERENCES Utente(Email) ON DELETE CASCADE,
	FOREIGN KEY(Collezione_museale)  REFERENCES Collezione_Museale(Nome) ON DELETE CASCADE
);

CREATE TABLE Aggiungi(
	Email_curatore VARCHAR(30),
	Autore SERIAL,
	FOREIGN KEY (Email_curatore) REFERENCES Utente(Email) ON DELETE CASCADE,
	FOREIGN KEY (Autore) REFERENCES Autore(Codice) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Modifica(
	Email_curatore VARCHAR(30),
	Opera_arte SERIAL,
	FOREIGN KEY (Email_curatore) REFERENCES Utente(Email) ON DELETE CASCADE,
	FOREIGN KEY (Opera_arte) REFERENCES Opera_Arte(Codice) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Elimina(
	Email_curatore VARCHAR(30),
	Commento SERIAL,
	FOREIGN KEY (Email_curatore) REFERENCES Utente(Email) ON DELETE CASCADE,
	FOREIGN KEY (Commento) REFERENCES Commento(Id_commento) ON DELETE CASCADE
);

CREATE TABLE Include_Opera(
	Storia SERIAL,
	Opera_arte SERIAL,
	FOREIGN KEY (Storia) REFERENCES Storia(Id_storia) ON DELETE CASCADE,
	FOREIGN KEY (Opera_arte) REFERENCES Opera_Arte(Codice) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE VIEW RD1_Collezione_Museale AS
SELECT COUNT(*) AS Numero_opere, Collezione_museale
FROM Opera_Arte
GROUP BY Collezione_museale;

CREATE VIEW RD2_Autori AS
SELECT DISTINCT Autore.Codice, Autore.Nome, Autore.Cognome
FROM Autore
JOIN Opera_Arte ON Autore.Codice = Opera_Arte.Autore;

CREATE VIEW RD3_Commenti AS
SELECT Commento.Campo_Testo, Commento.Emoji, Commento.Hashtag, Commento.Storia, Utente.Nome, Utente.Cognome
FROM Commento
JOIN Utente ON Commento.Utente = Utente.Email;

CREATE VIEW RD4_Annotazioni AS
SELECT Annotazione.Campo_testo, Annotazione.Emoji, Annotazione.Hashtag, Annotazione.Opera_arte, Utente.Nome, Utente.Cognome
FROM Annotazione
JOIN Utente ON Annotazione.Utente = Utente.Email;

CREATE VIEW RD5_Voti AS
SELECT Voto.Punteggio, Voto.Storia, Utente.Nome, Utente.Cognome
FROM Voto
JOIN Utente ON Voto.Utente = Utente.Email;

CREATE VIEW RD6_Durata_Storia AS
SELECT Id_storia, EXTRACT(EPOCH FROM (Fine - Inizio)) AS Durata
FROM Storia;

CREATE VIEW RD7_Eta_Utente AS
SELECT Email, DATE_PART('year', AGE(CURRENT_DATE, Data_nascita)) AS Eta
FROM Utente;

CREATE VIEW RD8_Eta_Autore AS
SELECT Codice, CASE
    WHEN Data_morte IS NOT NULL THEN DATE_PART('year', AGE(Data_morte, Data_nascita))
    ELSE DATE_PART('year', AGE(CURRENT_DATE, Data_nascita))
    END AS Eta
FROM Autore;


