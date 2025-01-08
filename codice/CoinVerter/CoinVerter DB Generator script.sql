DROP DATABASE IF EXISTS coinverter;
CREATE DATABASE coinverter;
USE coinverter;

CREATE TABLE prodotto(
	ID_prodotto INT NOT NULL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
   	prezzo DOUBLE NOT NULL,
    quantità INT,
    tipo VARCHAR(50) NOT NULL,
	foto MEDIUMBLOB,
	disponibile BOOLEAN NOT NULL
);

CREATE TABLE utente(
	email VARCHAR(50) NOT NULL PRIMARY KEY CHECK (Email LIKE '%@%'),
	pwd VARCHAR(128) NOT NULL,
	nome VARCHAR(25) NOT NULL,
	cognome VARCHAR(25) NOT NULL,
	isAdmin BOOLEAN NOT NULL
);

CREATE TABLE ordine(
	ID_ordine INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data_acquisto DATE NOT NULL,
    email VARCHAR(50) NOT NULL,
    FOREIGN KEY(email) REFERENCES utente(Email)
);


CREATE TABLE valuta(
	email VARCHAR(50),
    nome VARCHAR(50) NOT NULL,
	valore DOUBLE NOT NULL
    
);

CREATE TABLE acquisto(
	ID_ordine INT NOT NULL,
    q_acquisto INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
	tipo VARCHAR(50) NOT NULL,
	prezzo DOUBLE NOT NULL,
	FOREIGN KEY(ID_ordine) REFERENCES ordine(ID_ordine) ON UPDATE CASCADE
);
