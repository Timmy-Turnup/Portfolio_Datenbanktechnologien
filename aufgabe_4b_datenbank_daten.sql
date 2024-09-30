-- Tabelle Zielort
INSERT INTO Zielort (Zielort, Landessprache)
VALUES
    ('Berlin', 'Deutsch'),
    ('Paris', 'Französisch'),
    ('Rom', 'Italienisch'),
    ('Madrid', 'Spanisch'),
    ('Athen', 'Griechisch');

-- Tabelle Externer_Reiseveranstalter
INSERT INTO Externer_Reiseveranstalter (Name, Postleitzahl, Straße, Hausnummer)
VALUES
    ('Français Travel', '75001', 'Rue de Rivoli', '4'),
    ('Madrid Adventures', '28013', 'Calle Mayor', '30'),
    ('Greek Journeys', '10552', 'Panepistimiou', '28');

-- Tabelle Externer_Reiseveranstalter_Telefonnummer
INSERT INTO Externer_Reiseveranstalter_Telefonnummer (Telefonnummer, ReiseveranstalterNr)
VALUES
    ('030123456', 1),
    ('030123457', 1),
    ('014567891', 2),
    ('0039061234', 3);

-- Tabelle Reise
INSERT INTO Reise (Titel, Preis, Startdatum, Enddatum, Zielort, ReiseveranstalterNr)
VALUES
    ('Hauptstadtreise in Berlin', 799.99, '2024-05-01', '2024-05-07', 'Berlin', NULL),
    ('Romantik in Paris', 1099.00, '2024-06-14', '2024-06-20', 'Paris', 1),
    ('Antike in Rom', 999.50, '2024-07-10', '2024-07-16', 'Rom', NULL),
    ('Kulinarik in Madrid', 850.75, '2024-08-05', '2024-08-12', 'Madrid', 2),
    ('Mythologie in Athen', 780.00, '2024-09-18', '2024-09-25', 'Athen', 3);

-- Tabelle Kunde
INSERT INTO Kunde (Vorname, Nachname, Telefonnummer, E_Mail_Adresse, Postleitzahl, Straße, Hausnummer, ReiseNr)
VALUES
    ('Anna', 'Müller', '01761234567', 'anna.mueller@mail.com', '10435', 'Prenzlauer Allee', '12', 1),
    ('Thomas', 'Schneider', NULL, 'thomas.schneider@web.com', '10178', 'Alexanderplatz', '8', 2),
    ('Lena', 'Fischer', '01761123456', 'lena.fischer@mail.com', '10243', 'Frankfurter Allee', '25', 3),
    ('Markus', 'Schmidt', '01769012345', 'markus.schmidt@cloud.com', '10785', 'Potsdamer Straße', '5', 4),
    ('Katharina', 'Weber', NULL, 'katharina.weber@web.com', '10997', 'Stuttgarter Straße', '10', 5),
    ('Maria', 'Wagner', '01761237890', 'maria.wagner@mail.com', '10439', 'Baum Allee', '45', 1),
    ('Jonas', 'Bauer', NULL, 'jonas.bauer@cloud.com', '10555', 'Turmstraße', '10', 2);

-- Tabelle Team
INSERT INTO Team (Name, Standort)
VALUES
    ('Deutsche Entdecker', 'Berlin'),
    ('Pariser Romantiker', 'Paris'),
    ('Römische Helden', 'Rom'),
    ('Madrid Gourmets', 'Madrid'),
    ('Athenische Mythologen', 'Athen');

-- Tabelle Reiseleitung
INSERT INTO Reiseleitung (Vorname, Nachname, Geburtsdatum, Gehalt, TeamNr)
VALUES
    ('Sabine', 'Keller', '1980-02-15', 3500.00, 1),
    ('Jean', 'Gurand', '1975-06-22', 3900.00, 2),
    ('Giulia', 'Venezia', '1985-03-05', 3700.00, 3),
    ('Carlos', 'Moreno', '1990-08-10', 3200.00, 4),
    ('Maria', 'Nikolaou', '1982-12-20', 3600.00, 5);

-- Tabelle Reiseleitung_Sprache
INSERT INTO Reiseleitung_Sprache (Sprache, ReiseleiterNr)
VALUES
    ('Deutsch', 1),
    ('Englisch', 1),
    ('Französisch', 2),
    ('Englisch', 2),
    ('Italienisch', 3),
    ('Deutsch', 3),
    ('Englisch', 3),
    ('Spanisch', 4),
    ('Englisch', 4),
    ('Griechisch', 5),
    ('Englisch', 5);

-- Tabelle reise_reiseleitung
INSERT INTO reise_reiseleitung (ReiseNr, ReiseleiterNr)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 2),
    (4, 4),
    (5, 5),
    (5, 1);

-- Tabelle Station
INSERT INTO Station (lfdStationNr, ReiseNr, Datum, Ort, Kurzbeschreibung)
VALUES
    (1, 1, '2024-05-02', 'Reichstag', 'Besuch des Deutschen Bundestags'),
    (2, 1, '2024-05-03', 'Brandenburger Tor', 'Führung durch das historische Berlin'),
    (3, 2, '2024-06-15', 'Eiffelturm', 'Besuch des Wahrzeichens von Paris'),
    (4, 2, '2024-06-16', 'Louvre', 'Besuch des Kunstmuseums'),
    (5, 3, '2024-07-11', 'Kolosseum', 'Erkundung des Amphitheaters'),
    (6, 3, '2024-07-12', 'Vatikanstadt', 'Besichtigung des Petersdoms'),
    (7, 4, '2024-08-06', 'Plaza Mayor', 'Besichtigung des wichtigen Wahrzeichens'),
    (8, 4, '2024-08-07', 'Estadio Santiago Bernabéu,', 'Führung durch das neue Stadion von Real Madrid'),
    (9, 5, '2024-09-19', 'Akropolis', 'Besuch der antiken Stätte'),
    (10, 5, '2024-09-20', 'Athen Innenstadt', 'Stadtrundgang durch Athen');

-- Tabelle Teamleitung
INSERT INTO Teamleitung (ReiseleiterNr_B, ReiseleiterNr_V)
VALUES
    (1, 2),
    (3, 1),
    (4, 3),
    (5, 4),
    (2, 5);
