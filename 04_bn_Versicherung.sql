/* TABLES */
CREATE TABLE Versicherungsvertrag
    (ID                     INTEGER     NOT NULL ,
     Vertragsnummer         VARCHAR(20) NOT NULL,
     Abschlussdatum         DATE        NOT NULL,
     Art                    CHAR(2)     NOT NULL,
     Mitarbeiter_ID         INTEGER     NOT NULL,
     Fahrzeug_ID            INTEGER     NOT NULL,
     Versicherungsnehmer_ID INTEGER     NOT NULL,
     CONSTRAINT Versicherungsvertrag_PK  PRIMARY KEY (ID)
    );
 
CREATE TABLE Zuordnung_SF_FZ
    (ID              INTEGER       NOT NULL ,
     Schadensfall_ID INTEGER       NOT NULL,
     Fahrzeug_ID     INTEGER       NOT NULL,
     Schadenshoehe   DECIMAL(16,2),
     CONSTRAINT Zuordnung_SF_FZ_PK  PRIMARY KEY (ID)
    );
 
CREATE TABLE Schadensfall
    (ID              INTEGER       NOT NULL ,
     Datum           DATE          NOT NULL,
     Ort             VARCHAR(200)  NOT NULL,
     Beschreibung    VARCHAR(1000) NOT NULL,
     Schadenshoehe   DECIMAL(16,2),
     Verletzte       CHAR(1)       NOT NULL,
     Mitarbeiter_ID  INTEGER       NOT NULL,
     CONSTRAINT Schadensfall_PK  PRIMARY KEY (ID)
    );
    
CREATE TABLE Versicherungsgesellschaft
    (ID              INTEGER       NOT NULL ,
     Bezeichnung     VARCHAR(30)   NOT NULL,
     Ort             VARCHAR(30),
     CONSTRAINT Versicherungsgesellschaft_PK  PRIMARY KEY (ID)
    );
 
CREATE TABLE Versicherungsnehmer
    (ID              INTEGER       NOT NULL ,
     Name            VARCHAR(30)   NOT NULL,
     Vorname         VARCHAR(30),
     Geburtsdatum    DATE,
     Fuehrerschein   DATE,
     Ort             VARCHAR(30)   NOT NULL,
     PLZ             CHAR(5)       NOT NULL,
     Strasse         VARCHAR(30)   NOT NULL,
     Hausnummer      VARCHAR(10)   NOT NULL,
     Eigener_Kunde   CHAR(1)       NOT NULL,
     Versicherungsgesellschaft_ID  INTEGER,
     CONSTRAINT Versicherungsnehmer_PK  PRIMARY KEY (ID),
     CONSTRAINT `VN_VG` FOREIGN KEY (`Versicherungsgesellschaft_ID`) REFERENCES `Versicherungsgesellschaft` (`ID`)
    );
 
CREATE TABLE Fahrzeug
    (ID              INTEGER       NOT NULL ,
     Kennzeichen     VARCHAR(10)   NOT NULL,
     Farbe           VARCHAR(30),
     Fahrzeugtyp_ID  INTEGER       NOT NULL,
     CONSTRAINT Fahrzeug_PK  PRIMARY KEY (ID)
    );
 
CREATE TABLE Dienstwagen
    (ID              INTEGER       NOT NULL AUTO_INCREMENT,
     Kennzeichen     VARCHAR(10)   NOT NULL,
     Farbe           VARCHAR(30),
     Fahrzeugtyp_ID  INTEGER       NOT NULL,
     Mitarbeiter_ID  INTEGER,
     CONSTRAINT Dienstwagen_PK  PRIMARY KEY (ID)
    );
 
CREATE TABLE Mitarbeiter
    (ID              INTEGER       NOT NULL ,
     Personalnummer  VARCHAR(10)   NOT NULL,
     Name            VARCHAR(30)   NOT NULL,
     Vorname         VARCHAR(30)   NOT NULL,
     Geburtsdatum    DATE          NOT NULL,
     Telefon         VARCHAR(30),
     Mobil           VARCHAR(30),
     Email           VARCHAR(50),
     Raum            VARCHAR(10),
     Ist_Leiter      CHAR(1)       NOT NULL,
     Abteilung_ID    INTEGER       NOT NULL,
     CONSTRAINT Mitarbeiter_PK  PRIMARY KEY (ID)
    );
 
 
CREATE TABLE Fahrzeugtyp
    (ID              INTEGER       NOT NULL ,
     Bezeichnung     VARCHAR(30)   NOT NULL,
     Hersteller_ID   INTEGER       NOT NULL,
     CONSTRAINT Fahrzeugtyp_PK  PRIMARY KEY (ID)
    );
 
CREATE TABLE Abteilung
    (ID              INTEGER       NOT NULL ,
     Kuerzel         VARCHAR(10)   NOT NULL,
     Bezeichnung     VARCHAR(30)   NOT NULL,
     Ort             VARCHAR(30),
     CONSTRAINT Abteilung_PK  PRIMARY KEY (ID)
    );
 ALTER TABLE `Mitarbeiter`
  ADD CONSTRAINT `MAB_ABT` FOREIGN KEY (`Abteilung_ID`) REFERENCES `Abteilung` (`ID`);
  
CREATE TABLE Fahrzeughersteller
    (ID              INTEGER       NOT NULL ,
     Name            VARCHAR(30)   NOT NULL,
     Land            VARCHAR(30),
     CONSTRAINT Fahrzeughersteller_PK  PRIMARY KEY (ID)
    );
ALTER TABLE `Fahrzeugtyp`
ADD CONSTRAINT `ist_vom_Hersteller` FOREIGN KEY (`Hersteller_ID`) REFERENCES `Fahrzeughersteller` (`ID`); 
  
/* Basisdaten */
INSERT INTO Fahrzeughersteller (ID, NAME, LAND) VALUES (1, 'Volkswagen', 'Deutschland');
INSERT INTO Fahrzeughersteller (ID, NAME, LAND) VALUES ('2', 'Opel', 'Deutschland');
INSERT INTO Fahrzeughersteller (id, NAME, LAND) VALUES ('3', 'Ford', 'Deutschland');
INSERT INTO Fahrzeughersteller (id, NAME, LAND) VALUES ('4', 'BMW', 'Deutschland');
INSERT INTO Fahrzeughersteller (id, NAME, LAND) VALUES ('5', 'Audi', 'Deutschland');
INSERT INTO Fahrzeughersteller (id, NAME, LAND) VALUES ('6', 'Mercedes-Benz', 'Deutschland');
INSERT INTO Fahrzeughersteller (id, NAME, LAND) VALUES ('7', 'Sachsenring', 'Deutschland');
INSERT INTO Fahrzeughersteller (id, NAME, LAND) VALUES ('8', 'Saab', 'Schweden');
INSERT INTO Fahrzeughersteller (id, NAME)       VALUES ('9', 'Volvo');
INSERT INTO Fahrzeughersteller (id, NAME, LAND) VALUES ('10', 'Renault', 'Frankreich');
INSERT INTO Fahrzeughersteller (id, NAME)       VALUES ('11', 'Seat');

INSERT INTO Fahrzeugtyp (id, BEZEICHNUNG, HERSTELLER_ID) VALUES ('1', 'Polo', 1);
INSERT INTO Fahrzeugtyp (id, BEZEICHNUNG, HERSTELLER_ID) VALUES (2, 'Golf', 1);
INSERT INTO Fahrzeugtyp (id, BEZEICHNUNG, HERSTELLER_ID) VALUES (3, 'Passat', 1);
INSERT INTO Fahrzeugtyp (id, BEZEICHNUNG, HERSTELLER_ID) VALUES (4, 'Kadett', 2);
INSERT INTO Fahrzeugtyp (id, BEZEICHNUNG, HERSTELLER_ID) VALUES (5, 'Corsa', 2);
INSERT INTO Fahrzeugtyp (id, BEZEICHNUNG, HERSTELLER_ID) VALUES (6, 'Focus', 3);
INSERT INTO Fahrzeugtyp (id, BEZEICHNUNG, HERSTELLER_ID) VALUES (7, 'Trabant', 7);
INSERT INTO Fahrzeugtyp (id, BEZEICHNUNG, HERSTELLER_ID) VALUES (8, 'Fiesta', 3);
INSERT INTO Fahrzeugtyp (id, BEZEICHNUNG, HERSTELLER_ID) VALUES (9, '325', 4);
INSERT INTO Fahrzeugtyp (id, BEZEICHNUNG, HERSTELLER_ID) VALUES (10, '525', 4);
INSERT INTO Fahrzeugtyp (id, BEZEICHNUNG, HERSTELLER_ID) VALUES (11, 'Z3', 4);
INSERT INTO Fahrzeugtyp (id, BEZEICHNUNG, HERSTELLER_ID) VALUES (12, 'A3', 5);
INSERT INTO Fahrzeugtyp (id, BEZEICHNUNG, HERSTELLER_ID) VALUES (13, 'A4', 5);
INSERT INTO Fahrzeugtyp (id, BEZEICHNUNG, HERSTELLER_ID) VALUES (14, 'A160', 6);
INSERT INTO Fahrzeugtyp (id, BEZEICHNUNG, HERSTELLER_ID) VALUES (15, 'W204 (C-Klasse)', 6);
INSERT INTO Fahrzeugtyp (id, BEZEICHNUNG, HERSTELLER_ID) VALUES (16, 'W211 (E-Klasse)', 6);
INSERT INTO Fahrzeugtyp (id, BEZEICHNUNG, HERSTELLER_ID) VALUES (17, 'Saab 9-3', 8);
INSERT INTO Fahrzeugtyp (id, BEZEICHNUNG, HERSTELLER_ID) VALUES (18, 'S40', 9);
INSERT INTO Fahrzeugtyp (id, BEZEICHNUNG, HERSTELLER_ID) VALUES (19, 'C30', 9);
INSERT INTO Fahrzeugtyp (id, BEZEICHNUNG, HERSTELLER_ID) VALUES (20, 'Clio', 10);
INSERT INTO Fahrzeugtyp (id, BEZEICHNUNG, HERSTELLER_ID) VALUES (21, 'ZOE', 10);
INSERT INTO Fahrzeugtyp (id, BEZEICHNUNG, HERSTELLER_ID) VALUES (22, 'Twingo', 10);
INSERT INTO Fahrzeugtyp (id, BEZEICHNUNG, HERSTELLER_ID) VALUES (23, 'Ibiza', 11);
INSERT INTO Fahrzeugtyp (id, BEZEICHNUNG, HERSTELLER_ID) VALUES (24, 'Leon', 11);

 
INSERT INTO Abteilung (id, Kuerzel, BEZEICHNUNG, ORT) VALUES(1, 'Fibu', 'Finanzbuchhaltung', 'Dortmund');
INSERT INTO Abteilung (id, Kuerzel, BEZEICHNUNG, ORT) VALUES(2, 'Albu', 'Anlagenbuchhaltung', 'Dortmund');
INSERT INTO Abteilung (id, Kuerzel, BEZEICHNUNG, ORT) VALUES(3, 'Kore', 'Kostenrechnung', 'Dortmund');
INSERT INTO Abteilung (id, Kuerzel, BEZEICHNUNG, ORT) VALUES(4, 'Kopl', 'Kostenplanung', 'Dortmund');
INSERT INTO Abteilung (id, Kuerzel, BEZEICHNUNG, ORT) VALUES(5, 'Vert', 'Vertrieb', 'Essen');
INSERT INTO Abteilung (id, Kuerzel, BEZEICHNUNG, ORT) VALUES(6, 'Lagh', 'Lagerhaltung', 'Bochum');
INSERT INTO Abteilung (id, Kuerzel, BEZEICHNUNG, ORT) VALUES(7, 'Prod', 'Produktion', 'Bochum');
INSERT INTO Abteilung (id, Kuerzel, BEZEICHNUNG, ORT) VALUES(8, 'ScAb', 'Schadensabwicklung', 'Essen');
INSERT INTO Abteilung (id, Kuerzel, BEZEICHNUNG, ORT) VALUES(9, 'Pers', 'Personalverwaltung', 'Essen');
INSERT INTO Abteilung (id, Kuerzel, BEZEICHNUNG, ORT) VALUES(10, 'Soz', 'Sozialverwaltung', 'Essen');
INSERT INTO Abteilung (id, Kuerzel, BEZEICHNUNG, ORT) VALUES(11, 'Ausb', 'Ausbildung', 'Herne');
INSERT INTO Abteilung (id, Kuerzel, BEZEICHNUNG, ORT) VALUES(12, 'Fue', 'Forschung und Entwicklung', 'Bochum');

/* Basisdaten: Mitarbeiter
   für jede Abteilung Leiterin und eine Mitarbeiterin,
   für Vertrieb und Schadensabwicklung jeweils insgesamt 4 Personen
 */
INSERT INTO Mitarbeiter (id, PERSONALNUMMER, NAME, VORNAME, GEBURTSDATUM, TELEFON, MOBIL, EMAIL, RAUM, IST_LEITER, ABTEILUNG_ID) VALUES (1, '10001', 'Müller', 'Kurt',  '1977-01-05'  , '0231/5554987', '', 'kurt.mueller@unserefirma.de', '112', 'J', 1);
INSERT INTO Mitarbeiter (id, PERSONALNUMMER, NAME, VORNAME, GEBURTSDATUM, TELEFON, MOBIL, EMAIL, RAUM, IST_LEITER, ABTEILUNG_ID) VALUES (2, '10002', 'Schneider', 'Daniela',  '1980-02-16' , '0231/5554988', NULL, 'daniela.schneider@unserefirma.de', '113', 'N', 1);
INSERT INTO Mitarbeiter (id, PERSONALNUMMER, NAME, VORNAME, GEBURTSDATUM, TELEFON, MOBIL, EMAIL, RAUM, IST_LEITER, ABTEILUNG_ID) VALUES (3, '20001', 'Meyer', 'Walter',  '1963-07-02' , '0231/5553967', '', 'walter.meyer@unserefirma.de', '212', 'J', 2);
INSERT INTO Mitarbeiter (id, PERSONALNUMMER, NAME, VORNAME, GEBURTSDATUM, TELEFON, MOBIL, EMAIL, RAUM, IST_LEITER, ABTEILUNG_ID) VALUES (4, '20002', 'Schmitz', 'Michael',  '1959-08-25' , '0231/5556187', NULL, 'michael.schmitz@unserefirma.de', '212', 'N', 2);
INSERT INTO Mitarbeiter (id, PERSONALNUMMER, NAME, VORNAME, GEBURTSDATUM, TELEFON, MOBIL, EMAIL, RAUM, IST_LEITER, ABTEILUNG_ID) VALUES (5, '30001', 'Wagner', 'Gaby',  '1970-01-18' , '0231/5554787', '', 'gaby.wagner@unserefirma.de', '312', 'J', 3);
INSERT INTO Mitarbeiter (id, PERSONALNUMMER, NAME, VORNAME, GEBURTSDATUM, TELEFON, MOBIL, EMAIL, RAUM, IST_LEITER, ABTEILUNG_ID) VALUES (6, '30002', 'Feyerabend', 'Werner',  '1982-04-01' , '0231/5554997', NULL, 'werner.feyerabend@unserefirma.de', '316', 'N', 3);
INSERT INTO Mitarbeiter (id, PERSONALNUMMER, NAME, VORNAME, GEBURTSDATUM, TELEFON, MOBIL, EMAIL, RAUM, IST_LEITER, ABTEILUNG_ID) VALUES (7, '40001', 'Langmann', 'Matthias',  '1976-03-28'  , '0231/5551927', '', 'matthias.langmann@unserefirma.de', '412', 'J', 4);
INSERT INTO Mitarbeiter (id, PERSONALNUMMER, NAME, VORNAME, GEBURTSDATUM, TELEFON, MOBIL, EMAIL, RAUM, IST_LEITER, ABTEILUNG_ID) VALUES (8, '40002', 'Peters', 'Michael',  '1973-11-15' , '0231/5554237', NULL, 'michael.peters@unserefirma.de', '412', 'N', 4);
INSERT INTO Mitarbeiter (id, PERSONALNUMMER, NAME, VORNAME, GEBURTSDATUM, TELEFON, MOBIL, EMAIL, RAUM, IST_LEITER, ABTEILUNG_ID) VALUES (9, '50001', 'Pohl', 'Helmut',  '1980-10-27' , '0201/4014186', '(0171) 4123456', 'helmut.pohl@unserefirma.de', '152', 'J', 5);
INSERT INTO Mitarbeiter (id, PERSONALNUMMER, NAME, VORNAME, GEBURTSDATUM, TELEFON, MOBIL, EMAIL, RAUM, IST_LEITER, ABTEILUNG_ID) VALUES (10, '50002', 'Braun', 'Christian',  '1966-09-05' , '0201/4014726', '(0170) 8351647', 'christian.braun@unserefirma.de', '153', 'N', 5);
INSERT INTO Mitarbeiter (id, PERSONALNUMMER, NAME, VORNAME, GEBURTSDATUM, TELEFON, MOBIL, EMAIL, RAUM, IST_LEITER, ABTEILUNG_ID) VALUES (11, '50003', 'Polovic', 'Frantisek',  '1961-11-26' , '0201/4014727', '(0161) 5124793', 'frantisek.polovic@unserefirma.de', '154', 'N', 5);
INSERT INTO Mitarbeiter (id, PERSONALNUMMER, NAME, VORNAME, GEBURTSDATUM, TELEFON, MOBIL, EMAIL, RAUM, IST_LEITER, ABTEILUNG_ID) VALUES (12, '50004', 'Kalman', 'Aydin',  '1976-12-17' , '0201/4014728', '(0161) 4486319', 'aydin.kalman@unserefirma.de', '155', 'N', 5);
INSERT INTO Mitarbeiter (id, PERSONALNUMMER, NAME, VORNAME, GEBURTSDATUM, TELEFON, MOBIL, EMAIL, RAUM, IST_LEITER, ABTEILUNG_ID) VALUES (13, '60001', 'Aagenau', 'Karolin',  '1950-01-02' , '0234/66006001', '', 'Karolin.Aagenau@unserefirma.de', '48', 'J', 6);
INSERT INTO Mitarbeiter (id, PERSONALNUMMER, NAME, VORNAME, GEBURTSDATUM, TELEFON, MOBIL, EMAIL, RAUM, IST_LEITER, ABTEILUNG_ID) VALUES (14, '60002', 'Pinkart', 'Petra',  '1953-03-04' , '0234/66006002', NULL, 'Petra.Pinkart@unserefirma.de', '43', 'N', 6);
INSERT INTO Mitarbeiter (id, PERSONALNUMMER, NAME, VORNAME, GEBURTSDATUM, TELEFON, MOBIL, EMAIL, RAUM, IST_LEITER, ABTEILUNG_ID) VALUES (15, '70001', 'Olschewski', 'Pjotr',  '1956-05-06' , '0234/66007001', '', 'Pjotr.Olschewski@unserefirma.de', '28', 'J', 7);
INSERT INTO Mitarbeiter (id, PERSONALNUMMER, NAME, VORNAME, GEBURTSDATUM, TELEFON, MOBIL, EMAIL, RAUM, IST_LEITER, ABTEILUNG_ID) VALUES (16, '70002', 'Nordmann', 'Jörg',  '1959-07-08' , '0234/66007002', NULL, 'Joerg.Nordmann@unserefirma.de', '27', 'N', 7);
INSERT INTO Mitarbeiter (id, PERSONALNUMMER, NAME, VORNAME, GEBURTSDATUM, TELEFON, MOBIL, EMAIL, RAUM, IST_LEITER, ABTEILUNG_ID) VALUES (17, '80001', 'Schindler', 'Christina',  '1962-09-10' , '0201/4012151', '(0173) 7513901', 'Christina.Schindler@unserefirma.de', '101', 'J', 8);
INSERT INTO Mitarbeiter (id, PERSONALNUMMER, NAME, VORNAME, GEBURTSDATUM, TELEFON, MOBIL, EMAIL, RAUM, IST_LEITER, ABTEILUNG_ID) VALUES (18, '80002', 'Aliman', 'Zafer',  '1965-11-12' , '0201/4012161', '(0171) 9416755', 'Zafer.Aliman@unserefirma.de', '102', 'N', 8);
INSERT INTO Mitarbeiter (id, PERSONALNUMMER, NAME, VORNAME, GEBURTSDATUM, TELEFON, MOBIL, EMAIL, RAUM, IST_LEITER, ABTEILUNG_ID) VALUES (19, '80003', 'Langer', 'Norbert',  '1968-01-13' , '0201/4012171', '(0162) 1357902', 'Norbert.Langer@unserefirma.de', '103', 'N', 8);
INSERT INTO Mitarbeiter (id, PERSONALNUMMER, NAME, VORNAME, GEBURTSDATUM, TELEFON, MOBIL, EMAIL, RAUM, IST_LEITER, ABTEILUNG_ID) VALUES (20, '80004', 'Kolic', 'Ivana',  '1971-02-14' , '0201/4012181', '(0172) 4680135', 'Ivana.Kolic@unserefirma.de', '104', 'N', 8);
INSERT INTO Mitarbeiter (id, PERSONALNUMMER, NAME, VORNAME, GEBURTSDATUM, TELEFON, MOBIL, EMAIL, RAUM, IST_LEITER, ABTEILUNG_ID) VALUES (21, '90001', 'Janssen', 'Bernhard',  '1974-03-15' , '0201/4013111', '', 'Bernhard.Janssen@unserefirma.de', '201', 'J', 9);
INSERT INTO Mitarbeiter (id, PERSONALNUMMER, NAME, VORNAME, GEBURTSDATUM, TELEFON, MOBIL, EMAIL, RAUM, IST_LEITER, ABTEILUNG_ID) VALUES (22, '90002', 'Hinkel', 'Martina',  '1977-04-16' , '0201/4013110', NULL, 'Martina.Hinkel@unserefirma.de', '203', 'N', 9);
INSERT INTO Mitarbeiter (id, PERSONALNUMMER, NAME, VORNAME, GEBURTSDATUM, TELEFON, MOBIL, EMAIL, RAUM, IST_LEITER, ABTEILUNG_ID) VALUES (23, '100001', 'Grosser', 'Horst',  '1980-05-17' , '0201/4013344', '', 'Horst.Grosser@unserefirma.de', '271', 'J', 10);
INSERT INTO Mitarbeiter (id, PERSONALNUMMER, NAME, VORNAME, GEBURTSDATUM, TELEFON, MOBIL, EMAIL, RAUM, IST_LEITER, ABTEILUNG_ID) VALUES (24, '100002', 'Friedrichsen', 'Angelina',  '1983-06-20' , '0201/4013345', NULL, 'Angelina.Friedrichsen@unserefirma.de', '273', 'N', 10);
INSERT INTO Mitarbeiter (id, PERSONALNUMMER, NAME, VORNAME, GEBURTSDATUM, TELEFON, MOBIL, EMAIL, RAUM, IST_LEITER, ABTEILUNG_ID) VALUES (25, '110001', 'Eggert', 'Louis',  '1986-07-23' , '02323/381456', '', 'Louis.Eggert@unserefirma.de', '14', 'J', 11);
INSERT INTO Mitarbeiter (id, PERSONALNUMMER, NAME, VORNAME, GEBURTSDATUM, TELEFON, MOBIL, EMAIL, RAUM, IST_LEITER, ABTEILUNG_ID) VALUES (26, '110002', 'Deiters', 'Gisela',  '1989-08-26' , '02323/381457', NULL, 'Gisela.Deiters@unserefirma.de', '18', 'N', 11);
INSERT INTO Mitarbeiter (id, PERSONALNUMMER, NAME, VORNAME, GEBURTSDATUM, TELEFON, MOBIL, EMAIL, RAUM, IST_LEITER, ABTEILUNG_ID) VALUES (27, '120001', 'Carlsen', 'Zacharias',  '1965-09-29' , '0234/66012001', '', 'Zacharias.Carlsen@unserefirma.de', '61', 'J', 12);
INSERT INTO Mitarbeiter (id, PERSONALNUMMER, NAME, VORNAME, GEBURTSDATUM, TELEFON, MOBIL, EMAIL, RAUM, IST_LEITER, ABTEILUNG_ID) VALUES (28, '120002', 'Baber', 'Yvonne',  '1957-10-02' , '0234/66012002', NULL, 'Yvonne.Baber@unserefirma.de', '62', 'N', 12);
 
/* Basisdaten: für jeden Abteilungsleiter ein Dienstwagen */
alter table Dienstwagen AUTO_INCREMENT=1;
INSERT INTO Dienstwagen ( Kennzeichen, Farbe, Fahrzeugtyp_ID, Mitarbeiter_ID) SELECT CONCAT ("DO-WB 42", Abteilung_ID), 'elfenbein', 14, ID FROM Mitarbeiter WHERE Ist_Leiter = 'J';
 
/* Basisdaten: ein paar weitere Dienstwagen */
INSERT INTO Dienstwagen (Kennzeichen, Farbe, Fahrzeugtyp_ID, Mitarbeiter_ID) VALUES ('DO-WB 111', 'elfenbein', 16, NULL);
INSERT INTO Dienstwagen (Kennzeichen, Farbe, Fahrzeugtyp_ID, Mitarbeiter_ID) SELECT CONCAT("DO-WB 3",Abteilung_ID,SUBSTR(Personalnummer, 5, 1)), 'gelb', SUBSTR(Personalnummer, 5, 1), ID FROM Mitarbeiter WHERE Abteilung_ID IN (5, 8) AND Ist_Leiter = 'N';
 
/* Basisdaten: Versicherungsgesellschaften */
INSERT INTO Versicherungsgesellschaft (id, Bezeichnung, Ort) VALUES (1, 'Deutsches Kontor', 'Frankfurt a.M.');
INSERT INTO Versicherungsgesellschaft (id, Bezeichnung, Ort) VALUES (2, 'Rheinischer Vers.-Verein', 'Oberhausen');
INSERT INTO Versicherungsgesellschaft (id, Bezeichnung, Ort) VALUES (3, 'Knappschaftshilfe', 'Essen');
INSERT INTO Versicherungsgesellschaft (id, Bezeichnung, Ort) VALUES (4, 'Hannoversche Gesellschaft', 'Lehrte');
INSERT INTO Versicherungsgesellschaft (id, Bezeichnung, Ort) VALUES (5, 'Westfalen-Bruderhilfe', 'Recklinghausen');
 
/* Arbeitsdaten: Fahrzeuge von Versicherten */
INSERT INTO Fahrzeug (id, Kennzeichen, Farbe, Fahrzeugtyp_ID) VALUES (1,'RE-LM 901', 'ocker', 5);
INSERT INTO Fahrzeug (id, Kennzeichen, Farbe, Fahrzeugtyp_ID) VALUES (2, 'RE-LM 902', 'ocker', 5);
INSERT INTO Fahrzeug (id, Kennzeichen, Farbe, Fahrzeugtyp_ID) VALUES (3, 'RE-LM 903', 'ocker', 5);
INSERT INTO Fahrzeug (id, Kennzeichen, Farbe, Fahrzeugtyp_ID) VALUES (4, 'GE-AB 123', 'schwarz', 22);
INSERT INTO Fahrzeug (id, Kennzeichen, Farbe, Fahrzeugtyp_ID) VALUES (5, 'RE-CD 456', 'ocker', 21);
INSERT INTO Fahrzeug (id, Kennzeichen, Farbe, Fahrzeugtyp_ID) VALUES (6, 'HER-EF 789', 'gelb', 20);
INSERT INTO Fahrzeug (id, Kennzeichen, Farbe, Fahrzeugtyp_ID) VALUES (7, 'BO-GH 102', 'rot', 19);
INSERT INTO Fahrzeug (id, Kennzeichen, Farbe, Fahrzeugtyp_ID) VALUES (8, 'E-IJ 345', 'bordeaux', 18);
INSERT INTO Fahrzeug (id, Kennzeichen, Farbe, Fahrzeugtyp_ID) VALUES (9, 'BO-KL 678', 'blau', 17);
INSERT INTO Fahrzeug (id, Kennzeichen, Farbe, Fahrzeugtyp_ID) VALUES (10, 'RE-MN 901', 'elfenbein', 16);
INSERT INTO Fahrzeug (id, Kennzeichen, Farbe, Fahrzeugtyp_ID) VALUES (11, 'RE-OP 234', 'ocker', 15);
INSERT INTO Fahrzeug (id, Kennzeichen, Farbe, Fahrzeugtyp_ID) VALUES (12, 'RE-QR 567', 'gelb', 14);
INSERT INTO Fahrzeug (id, Kennzeichen, Farbe, Fahrzeugtyp_ID) VALUES (13, 'RE-ST 890', 'rot', 13);
INSERT INTO Fahrzeug (id, Kennzeichen, Farbe, Fahrzeugtyp_ID) VALUES (14, 'RE-UV 135', 'bordeaux', 12);
INSERT INTO Fahrzeug (id, Kennzeichen, Farbe, Fahrzeugtyp_ID) VALUES (15, 'RE-WX 791', 'ocker', 11);
INSERT INTO Fahrzeug (id, Kennzeichen, Farbe, Fahrzeugtyp_ID) VALUES (16, 'RE-YZ 369', 'rot', 10);
INSERT INTO Fahrzeug (id, Kennzeichen, Farbe, Fahrzeugtyp_ID) VALUES (17, 'GE-AC 246', 'elfenbein', 9);
INSERT INTO Fahrzeug (id, Kennzeichen, Farbe, Fahrzeugtyp_ID) VALUES (18, 'GE-EG 892', 'blau', 8);
INSERT INTO Fahrzeug (id, Kennzeichen, Farbe, Fahrzeugtyp_ID) VALUES (19, 'OB-FH 470', 'elfenbein', 7);
INSERT INTO Fahrzeug (id, Kennzeichen, Farbe, Fahrzeugtyp_ID) VALUES (20, 'BOT-KI 357', 'rot', 6);
INSERT INTO Fahrzeug (id, Kennzeichen, Farbe, Fahrzeugtyp_ID) VALUES (21, 'BOR-NO 234', 'gelb', 4);
INSERT INTO Fahrzeug (id, Kennzeichen, Farbe, Fahrzeugtyp_ID) VALUES (22, 'BOR-PQ 567', 'elfenbein', 3);
INSERT INTO Fahrzeug (id, Kennzeichen, Farbe, Fahrzeugtyp_ID) VALUES (23, 'BOR-RS 890', 'gelb', 2);
INSERT INTO Fahrzeug (id, Kennzeichen, Farbe, Fahrzeugtyp_ID) VALUES (24, 'K-XR 147', NULL, 6);
INSERT INTO Fahrzeug (id, Kennzeichen, Farbe, Fahrzeugtyp_ID) VALUES (25, 'HH-MM 783', 'schwarz', 7);

/* Arbeitsdaten: Versicherungsnehmer */
INSERT INTO Versicherungsnehmer (id, Name, Vorname, Geburtsdatum, Fuehrerschein, Ort, PLZ, Strasse, Hausnummer, Eigener_Kunde, Versicherungsgesellschaft_ID) VALUES (1, 'Heckel Obsthandel GmbH', '', NULL, NULL, 'Dorsten', '46282', 'Gahlener Str.', '40', 'J', NULL);
INSERT INTO Versicherungsnehmer (id, Name, Vorname, Geburtsdatum, Fuehrerschein, Ort, PLZ, Strasse, Hausnummer, Eigener_Kunde, Versicherungsgesellschaft_ID) VALUES (2, 'Antonius', 'Bernhard',  '1950-02-01' ,  '1972-04-03' , 'Gelsenkirchen', '45892', 'Coesfelder Str.', '23', 'J', NULL);
INSERT INTO Versicherungsnehmer (id, Name, Vorname, Geburtsdatum, Fuehrerschein, Ort, PLZ, Strasse, Hausnummer, Eigener_Kunde, Versicherungsgesellschaft_ID) VALUES (3,'Cornelsen', 'Dorothea',  '1951-06-05',  '1974-08-07' , 'Castrop-Rauxel', '44577', 'Kiefernweg', '9', 'J', NULL);
INSERT INTO Versicherungsnehmer (id, Name, Vorname, Geburtsdatum, Fuehrerschein, Ort, PLZ, Strasse, Hausnummer, Eigener_Kunde, Versicherungsgesellschaft_ID) VALUES (4,'Elberfeld', 'Fritz',  '1952-10-09' ,  '1976-12-11' , 'Herne', '44625', 'Haberstr.', '13', 'J', NULL);
INSERT INTO Versicherungsnehmer (id, Name, Vorname, Geburtsdatum, Fuehrerschein, Ort, PLZ, Strasse, Hausnummer, Eigener_Kunde, Versicherungsgesellschaft_ID) VALUES (5,'Geissler', 'Helga',  '1953-01-13' , '1978-02-14' , 'Bochum', '44809', 'Steinbankstr.', '15', 'J', NULL);
INSERT INTO Versicherungsnehmer (id, Name, Vorname, Geburtsdatum, Fuehrerschein, Ort, PLZ, Strasse, Hausnummer, Eigener_Kunde, Versicherungsgesellschaft_ID) VALUES (6,'Westermann', 'Yvonne',  '1961-08-07' ,  '1994-10-09' , 'Oer-Erkenschwick', '45739', 'Ackerstr.', '34', 'J', NULL);
INSERT INTO Versicherungsnehmer (id, Name, Vorname, Geburtsdatum, Fuehrerschein, Ort, PLZ, Strasse, Hausnummer, Eigener_Kunde, Versicherungsgesellschaft_ID) VALUES (7,'Karlovich', 'Liane',  '1955-05-19' ,  '1982-06-20' , 'Hattingen', '45525', 'Raabestr.', '21', 'J', NULL);
INSERT INTO Versicherungsnehmer (id, Name, Vorname, Geburtsdatum, Fuehrerschein, Ort, PLZ, Strasse, Hausnummer, Eigener_Kunde, Versicherungsgesellschaft_ID) VALUES (8,'Meier', 'Norbert',  '1956-07-22' ,  '1984-08-23' , 'Recklinghausen', '45665', 'Idastr.', '24', 'J', NULL);
INSERT INTO Versicherungsnehmer (id, Name, Vorname, Geburtsdatum, Fuehrerschein, Ort, PLZ, Strasse, Hausnummer, Eigener_Kunde, Versicherungsgesellschaft_ID) VALUES (9,'Ottensen', 'Petra',  '1957-09-25' ,  '1986-10-26' , 'Herten', '45699', 'Gablonzer Weg', '27', 'J', NULL);
INSERT INTO Versicherungsnehmer (id, Name, Vorname, Geburtsdatum, Fuehrerschein, Ort, PLZ, Strasse, Hausnummer, Eigener_Kunde, Versicherungsgesellschaft_ID) VALUES (10,'Quantz', 'Reinhard',  '1958-11-28' ,  '1988-01-29' , 'Datteln', '45711', 'Halterner Allee', '30', 'J', NULL);
INSERT INTO Versicherungsnehmer (id, Name, Vorname, Geburtsdatum, Fuehrerschein, Ort, PLZ, Strasse, Hausnummer, Eigener_Kunde, Versicherungsgesellschaft_ID) VALUES (11,'Schiller', 'Theresia',  '1959-03-31' ,  '1990-02-01' , 'Haltern', '45721', 'Am Freibad', '32', 'J', NULL);
INSERT INTO Versicherungsnehmer (id, Name, Vorname, Geburtsdatum, Fuehrerschein, Ort, PLZ, Strasse, Hausnummer, Eigener_Kunde, Versicherungsgesellschaft_ID) VALUES (12,'Untermann', 'Volker',  '1960-04-02' ,  '1992-06-05' , 'Waltrop', '45731', 'Goethestr.', '33', 'J', NULL);
INSERT INTO Versicherungsnehmer (id, Name, Vorname, Geburtsdatum, Fuehrerschein, Ort, PLZ, Strasse, Hausnummer, Eigener_Kunde, Versicherungsgesellschaft_ID) VALUES (13,'Westermann', 'Yvonne',  '1961-08-07' ,  '1994-10-09' , 'Oer-Erkenschwick', '45739', 'Ackerstr.', '34', 'J', NULL);
INSERT INTO Versicherungsnehmer (id, Name, Vorname, Geburtsdatum, Fuehrerschein, Ort, PLZ, Strasse, Hausnummer, Eigener_Kunde, Versicherungsgesellschaft_ID) VALUES (14,'Xanh', 'Wu Dao',  '1962-12-11' ,  '1996-01-13' , 'Marl', '45772', 'Bachackerweg', '35', 'J', NULL);
INSERT INTO Versicherungsnehmer (id, Name, Vorname, Geburtsdatum, Fuehrerschein, Ort, PLZ, Strasse, Hausnummer, Eigener_Kunde, Versicherungsgesellschaft_ID) VALUES (15,'Zenep', 'Altun',  '1963-02-14' ,  '1998-03-15' , 'Gelsenkirchen', '45888', 'Cheruskerstr.', '36', 'J', NULL);
INSERT INTO Versicherungsnehmer (id, Name, Vorname, Geburtsdatum, Fuehrerschein, Ort, PLZ, Strasse, Hausnummer, Eigener_Kunde, Versicherungsgesellschaft_ID) VALUES (16, 'Bronkovic', 'Cecilia',  '1964-04-16' ,  '2000-05-17' , 'Gladbeck', '45966', 'Dechenstr.', '37', 'J', NULL);
INSERT INTO Versicherungsnehmer (id, Name, Vorname, Geburtsdatum, Fuehrerschein, Ort, PLZ, Strasse, Hausnummer, Eigener_Kunde, Versicherungsgesellschaft_ID) VALUES (17, 'Deutschmann', 'Evelyn',  '1965-06-18' , '2002-07-19' , 'Oberhausen', '46147', 'Ebereschenweg', '38', 'J', NULL);
INSERT INTO Versicherungsnehmer (id, Name, Vorname, Geburtsdatum, Fuehrerschein, Ort, PLZ, Strasse, Hausnummer, Eigener_Kunde, Versicherungsgesellschaft_ID) VALUES (18,'Friedrichsen', 'Gustav',  '1966-08-20' ,  '2004-09-21' , 'Bottrop', '46244', 'Falkenweg', '39', 'J', NULL);
INSERT INTO Versicherungsnehmer (id, Name, Vorname, Geburtsdatum, Fuehrerschein, Ort, PLZ, Strasse, Hausnummer, Eigener_Kunde, Versicherungsgesellschaft_ID) VALUES (19,'Jaspers', 'Karol',  '1968-12-24' ,  '2008-01-25' , 'Borken', '46325', 'Heimser Weg', '1', 'J', NULL);
INSERT INTO Versicherungsnehmer (id, Name, Vorname, Geburtsdatum, Fuehrerschein, Ort, PLZ, Strasse, Hausnummer, Eigener_Kunde, Versicherungsgesellschaft_ID) VALUES (20,'Liebermann', 'Maria',  '1970-02-26' ,  '1988-03-27' , 'Velen', '46342', 'Inselstr.', '4', 'J', NULL);
INSERT INTO Versicherungsnehmer (id, Name, Vorname, Geburtsdatum, Fuehrerschein, Ort, PLZ, Strasse, Hausnummer, Eigener_Kunde, Versicherungsgesellschaft_ID) VALUES (21,'Grube', 'Claire',  '1977-07-05' ,  '1990-04-27' , 'Velen', '46342', 'Inselstr.', '4', 'J', NULL);
INSERT INTO Versicherungsnehmer (id, Name, Vorname, Geburtsdatum, Fuehrerschein, Ort, PLZ, Strasse, Hausnummer, Eigener_Kunde, Versicherungsgesellschaft_ID) VALUES (22,'Netep', 'Osman',  '1971-05-28' ,  '1990-06-29' , 'Raesfeld', '46348', 'Juister Str.', '7', 'J', NULL);
INSERT INTO Versicherungsnehmer (id, Name, Vorname, Geburtsdatum, Fuehrerschein, Ort, PLZ, Strasse, Hausnummer, Eigener_Kunde, Versicherungsgesellschaft_ID) VALUES (23,'Chwielorz', 'Kathrin',  '1981-08-18' , '2002-12-15' , 'Köln', '50173', 'Gartenfelder Str.', '23', 'N', 3);
INSERT INTO Versicherungsnehmer (id, Name, Vorname, Geburtsdatum, Fuehrerschein, Ort, PLZ, Strasse, Hausnummer, Eigener_Kunde, Versicherungsgesellschaft_ID) VALUES (24,'Schwichting', 'Eberhard',  '1985-06-27' ,  '2003-08-08' , 'Hamburg', '20444', 'Harvestehuder Weg', '23 a', 'N', 2);
 
/* Arbeitsdaten: für jeden Versicherungsnehmer und jedes Fahrzeug einen Versicherungsvertrag
   Abweichung: der erste Versicherte bekommt als GmbH drei Fahrzeuge, wegen der ID die ersten drei */
INSERT INTO Versicherungsvertrag (id, Vertragsnummer, Abschlussdatum, Art, Mitarbeiter_ID, Fahrzeug_ID, Versicherungsnehmer_ID) VALUES (1, 'DG-01',   '1974-05-03' , 'TK', 9, 1, 1);
INSERT INTO Versicherungsvertrag (id, Vertragsnummer, Abschlussdatum, Art, Mitarbeiter_ID, Fahrzeug_ID, Versicherungsnehmer_ID) VALUES (2,'DG-01',  '1974-05-03' , 'TK', 9, 2, 1);
INSERT INTO Versicherungsvertrag (id, Vertragsnummer, Abschlussdatum, Art, Mitarbeiter_ID, Fahrzeug_ID, Versicherungsnehmer_ID) VALUES (3, 'DG-01',  '1974-05-03' , 'TK', 9, 3, 1);
INSERT INTO Versicherungsvertrag (id, Vertragsnummer, Abschlussdatum, Art, Mitarbeiter_ID, Fahrzeug_ID, Versicherungsnehmer_ID) VALUES (4, 'DH-02',  '1990-02-01' , 'HP', 10, 12, 10);
INSERT INTO Versicherungsvertrag (id, Vertragsnummer, Abschlussdatum, Art, Mitarbeiter_ID, Fahrzeug_ID, Versicherungsnehmer_ID) VALUES (5,'DO-03',  '1994-10-09' , 'HP', 9, 14, 12);
INSERT INTO Versicherungsvertrag (id, Vertragsnummer, Abschlussdatum, Art, Mitarbeiter_ID, Fahrzeug_ID, Versicherungsnehmer_ID) VALUES (6,'DB-04',  '2008-01-25' , 'HP', 9, 21, 19);
INSERT INTO Versicherungsvertrag (id, Vertragsnummer, Abschlussdatum, Art, Mitarbeiter_ID, Fahrzeug_ID, Versicherungsnehmer_ID) VALUES (7,'RH-01',  '1976-12-11' , 'VK', 10, 5, 3);
INSERT INTO Versicherungsvertrag (id, Vertragsnummer, Abschlussdatum, Art, Mitarbeiter_ID, Fahrzeug_ID, Versicherungsnehmer_ID) VALUES (8,'RD-02',  '1988-01-29' , 'HP', 9, 11, 9);
INSERT INTO Versicherungsvertrag (id, Vertragsnummer, Abschlussdatum, Art, Mitarbeiter_ID, Fahrzeug_ID, Versicherungsnehmer_ID) VALUES (9,'RM-03',  '1996-01-13' , 'HP', 9, 15, 13);
INSERT INTO Versicherungsvertrag (id, Vertragsnummer, Abschlussdatum, Art, Mitarbeiter_ID, Fahrzeug_ID, Versicherungsnehmer_ID) VALUES (10,'RD-04',  '2006-11-23' , 'HP', 9, 20, 18);
INSERT INTO Versicherungsvertrag (id, Vertragsnummer, Abschlussdatum, Art, Mitarbeiter_ID, Fahrzeug_ID, Versicherungsnehmer_ID) VALUES (11,'RR-05',  '1990-06-29' , 'TK', 9, 23, 21);
INSERT INTO Versicherungsvertrag (id, Vertragsnummer, Abschlussdatum, Art, Mitarbeiter_ID, Fahrzeug_ID, Versicherungsnehmer_ID) VALUES (12,'KH-02',  '1986-10-26' , 'HP', 9, 10, 8);
INSERT INTO Versicherungsvertrag (id, Vertragsnummer, Abschlussdatum, Art, Mitarbeiter_ID, Fahrzeug_ID, Versicherungsnehmer_ID) VALUES (13,'KG-03',  '1998-03-15' , 'HP', 9, 16, 14);
INSERT INTO Versicherungsvertrag (id, Vertragsnummer, Abschlussdatum, Art, Mitarbeiter_ID, Fahrzeug_ID, Versicherungsnehmer_ID) VALUES (14,'KV-04',  '1988-03-27' , 'HP', 10, 22, 20);
INSERT INTO Versicherungsvertrag (id, Vertragsnummer, Abschlussdatum, Art, Mitarbeiter_ID, Fahrzeug_ID, Versicherungsnehmer_ID) VALUES (15,'HE-01',  '1980-04-17' , 'HP', 10, 7, 5);
INSERT INTO Versicherungsvertrag (id, Vertragsnummer, Abschlussdatum, Art, Mitarbeiter_ID, Fahrzeug_ID, Versicherungsnehmer_ID) VALUES (16,'HR-02',  '1984-08-23' , 'HP', 9, 9, 7);
INSERT INTO Versicherungsvertrag (id, Vertragsnummer, Abschlussdatum, Art, Mitarbeiter_ID, Fahrzeug_ID, Versicherungsnehmer_ID) VALUES (17,'HG-03',  '2000-05-17' , 'HP', 9, 17, 15);
INSERT INTO Versicherungsvertrag (id, Vertragsnummer, Abschlussdatum, Art, Mitarbeiter_ID, Fahrzeug_ID, Versicherungsnehmer_ID) VALUES (18,'HB-04',  '2004-09-21' , 'HP', 9, 19, 17);
INSERT INTO Versicherungsvertrag (id, Vertragsnummer, Abschlussdatum, Art, Mitarbeiter_ID, Fahrzeug_ID, Versicherungsnehmer_ID) VALUES (19,'XC-01',  '1974-08-07' , 'HP', 10, 4, 2);
INSERT INTO Versicherungsvertrag (id, Vertragsnummer, Abschlussdatum, Art, Mitarbeiter_ID, Fahrzeug_ID, Versicherungsnehmer_ID) VALUES (20,'XH-02',  '1982-06-20' , 'VK', 9, 8, 6);
INSERT INTO Versicherungsvertrag (id, Vertragsnummer, Abschlussdatum, Art, Mitarbeiter_ID, Fahrzeug_ID, Versicherungsnehmer_ID) VALUES (21,'XW-03',  '1992-06-05' , 'VK', 10, 13, 11);
INSERT INTO Versicherungsvertrag (id, Vertragsnummer, Abschlussdatum, Art, Mitarbeiter_ID, Fahrzeug_ID, Versicherungsnehmer_ID) VALUES (22,'XO-04',  '2002-07-19' , 'VK', 9, 18, 16);
INSERT INTO Versicherungsvertrag (id, Vertragsnummer, Abschlussdatum, Art, Mitarbeiter_ID, Fahrzeug_ID, Versicherungsnehmer_ID) VALUES (23,'KNH-234',  '2007-03-16' , 'TK', 9, 24, 22);
INSERT INTO Versicherungsvertrag (id, Vertragsnummer, Abschlussdatum, Art, Mitarbeiter_ID, Fahrzeug_ID, Versicherungsnehmer_ID) VALUES (24,'RVV-845',  '2003-08-08' , 'HP', 10, 25, 23);
INSERT INTO Versicherungsvertrag (id, Vertragsnummer, Abschlussdatum, Art, Mitarbeiter_ID, Fahrzeug_ID, Versicherungsnehmer_ID) VALUES (25,'KB-01',  '1978-02-14' , 'TK', 10, 6, 4);

 
/* Laufende Daten: ein paar erste Schadensfälle */
INSERT INTO Schadensfall (ID, Datum, Ort, Beschreibung, Schadenshoehe, Verletzte, Mitarbeiter_ID) VALUES (1,  '2007-02-03' , 'Recklinghausen, Bergknappenstr. 144', 'Gartenzaun gestreift', 1234.5, 'N', 14);
INSERT INTO Schadensfall (ID, Datum, Ort, Beschreibung, Schadenshoehe, Verletzte, Mitarbeiter_ID) VALUES (2,  '2007-07-11' , 'Haltern, Hauptstr. 46', 'beim Ausparken hat BO-GH 102 die Vorfahrt von RE-CD 456 missachtet', 2066, 'N', 15);
INSERT INTO Schadensfall (ID, Datum, Ort, Beschreibung, Schadenshoehe, Verletzte, Mitarbeiter_ID) VALUES (3,  '2007-12-19' , 'Marl, Rathausstr./Halterner Allee', 'beim Abbiegen nach links hat ein fremder Wagen die Vorfahrt missachtet', 3715.6, 'J', 14);
INSERT INTO Schadensfall (ID, Datum, Ort, Beschreibung, Schadenshoehe, Verletzte, Mitarbeiter_ID) VALUES (4,  '2008-05-27' , 'Recklinghausen, Südgrabenstr. 23', 'Fremdes parkendes Auto gestreift', 1438.75, 'N', 16);
INSERT INTO Schadensfall (ID, Datum, Ort, Beschreibung, Schadenshoehe, Verletzte, Mitarbeiter_ID) VALUES (5,  '2008-10-05' , 'Dorsten, Oberhausener Str. 18', 'beim Ausparken hat ein fremder Wagen die Vorfahrt missachtet', 1983, 'N', 14);
INSERT INTO Schadensfall (ID, Datum, Ort, Beschreibung, Schadenshoehe, Verletzte, Mitarbeiter_ID) VALUES (6,  '2009-03-13' , 'Marl, Rathausstr./Halterner Allee', 'beim Abbiegen nach links hat ein fremder Wagen die Vorfahrt missachtet', 4092.15, 'J', 15);
INSERT INTO Schadensfall (ID, Datum, Ort, Beschreibung, Schadenshoehe, Verletzte, Mitarbeiter_ID) VALUES (7,  '2009-08-21' , 'Recklinghausen, Bergknappenstr. 144', 'Laternenpfahl umgefahren', 865, 'N', 14);
INSERT INTO Schadensfall (ID, Datum, Ort, Beschreibung, Schadenshoehe, Verletzte, Mitarbeiter_ID) VALUES (8,  '2009-08-01' , 'L318 Hamm-Flaesheim', 'Wildunfall mit Reh; 10% Wertverlust', 2471.5, 'N', 16);

 
/* Laufende Daten: Zuordnung der Schadensfälle */
INSERT INTO Zuordnung_SF_FZ (id, Schadensfall_ID, Fahrzeug_ID, Schadenshoehe) VALUES (1, 1, 2, 1234.5);
INSERT INTO Zuordnung_SF_FZ (id, Schadensfall_ID, Fahrzeug_ID, Schadenshoehe) VALUES (2, 2, 7, 852);
INSERT INTO Zuordnung_SF_FZ (id, Schadensfall_ID, Fahrzeug_ID, Schadenshoehe) VALUES (3, 2, 5, 1214);
INSERT INTO Zuordnung_SF_FZ (id, Schadensfall_ID, Fahrzeug_ID, Schadenshoehe) VALUES (4, 3, 4, 1438.75);
INSERT INTO Zuordnung_SF_FZ (id, Schadensfall_ID, Fahrzeug_ID, Schadenshoehe) VALUES (5, 3, 24, 2276.85);
INSERT INTO Zuordnung_SF_FZ (id, Schadensfall_ID, Fahrzeug_ID, Schadenshoehe) VALUES (6, 4, 1, 1234.5);
INSERT INTO Zuordnung_SF_FZ (id, Schadensfall_ID, Fahrzeug_ID, Schadenshoehe) VALUES (7, 4, 5, 1983);
INSERT INTO Zuordnung_SF_FZ (id, Schadensfall_ID, Fahrzeug_ID, Schadenshoehe) VALUES (8, 5, 2, 1251.5);
INSERT INTO Zuordnung_SF_FZ (id, Schadensfall_ID, Fahrzeug_ID, Schadenshoehe) VALUES (9, 5, 25, 731.5);
INSERT INTO Zuordnung_SF_FZ (id, Schadensfall_ID, Fahrzeug_ID, Schadenshoehe) VALUES (10, 6, 3, 2653.4);
INSERT INTO Zuordnung_SF_FZ (id, Schadensfall_ID, Fahrzeug_ID, Schadenshoehe) VALUES (11, 6, 7, 1438.75);
INSERT INTO Zuordnung_SF_FZ (id, Schadensfall_ID, Fahrzeug_ID, Schadenshoehe) VALUES (12, 7, 6, 865);
INSERT INTO Zuordnung_SF_FZ (id, Schadensfall_ID, Fahrzeug_ID, Schadenshoehe) VALUES (13, 8, 7, NULL);