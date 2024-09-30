-- Einfügen von Daten in die Tabelle REISE
INSERT INTO REISE (reise_id, titel, zielort, startdatum, enddatum, preis)
VALUES
('R001', 'Abenteuer in den Alpen', 'Österreich', '2024-06-01', '2024-06-10', 1500.00),
('R002', 'Strandurlaub auf Mallorca', 'Spanien', '2024-07-15', '2024-07-22', 1200.00),
('R003', 'Kulturreise nach Rom', 'Italien', '2024-09-01', '2024-09-05', 800.00);

-- Einfügen von Daten in die Tabelle KUNDE
INSERT INTO KUNDE (kundennummer, name, adresse, telefonnummer, email)
VALUES
('K001', 'Anna Müller', 'Hauptstraße 1, 10115 Berlin', '030-123456', 'anna.mueller@example.com'),
('K002', 'Max Mustermann', 'Musterweg 10, 20145 Hamburg', '040-987654', 'max.mustermann@example.com'),
('K003', 'Lisa Meier', 'Bahnhofstraße 5, 80331 München', NULL, 'lisa.meier@example.com');

-- Einfügen von Daten in die Tabelle REISELEITUNG
INSERT INTO REISELEITUNG (leiter_id, name, geburtsdatum, gehalt)
VALUES
('L001', 'Julia Schmidt', '1985-03-12', 3500.00),
('L002', 'Thomas Becker', '1978-07-22', 3800.00),
('L003', 'Svenja Wagner', '1990-11-05', 3300.00);

-- Einfügen von Daten in die Tabelle TEAM
INSERT INTO TEAM (teamnummer, name, standort, leiter_id)
VALUES
('T001', 'Alpen-Adventure-Team', 'Innsbruck', 'L001'),
('T002', 'Sonnen-Team', 'Palma de Mallorca', 'L002'),
('T003', 'Kultur-Team Rom', 'Rom', 'L003');

-- Einfügen von Daten in die Tabelle STATION
INSERT INTO STATION (laufende_nummer, datum, ort, kurzbeschreibung, reise_id)
VALUES
(1, '2024-06-02', 'Innsbruck', 'Besuch der Nordkette', 'R001'),
(2, '2024-06-05', 'Salzburg', 'Besichtigung der Festung Hohensalzburg', 'R001'),
(3, '2024-06-08', 'Zell am See', 'Wanderung zum Großglockner', 'R001'),
(4, '2024-07-16', 'Palma de Mallorca', 'Stadtrundfahrt', 'R002'),
(5, '2024-07-18', 'Alcudia', 'Tagesausflug an den Strand', 'R002'),
(6, '2024-07-20', 'Cala Millor', 'Wanderung an der Ostküste', 'R002'),
(7, '2024-09-02', 'Vatikanstadt', 'Besuch des Petersdoms', 'R003'),
(8, '2024-09-03', 'Colosseum', 'Führung durch das antike Rom', 'R003'),
(9, '2024-09-04', 'Forum Romanum', 'Besichtigung der historischen Ruinen', 'R003');

-- Einfügen von Daten in die Tabelle REISEVERANSTALTER
INSERT INTO REISEVERANSTALTER (name, adresse, telefonnummer)
VALUES
('Bergreisen GmbH', 'Alpenstraße 12, 6020 Innsbruck', '0512-123456'),
('Sonne & Meer AG', 'Mallorcaweg 1, 07001 Palma de Mallorca', '971-654321'),
('Cultura Tours', 'Via del Corso 123, 00186 Rom', '06-9876543');

-- Einfügen von Daten in die n:m Beziehung REISE_REISELEITUNG
INSERT INTO REISE_REISELEITUNG (reise_id, leiter_id)
VALUES
('R001', 'L001'),
('R002', 'L002'),
('R003', 'L003');

-- Einfügen von Kundenzuordnungen für gebuchte Reisen
INSERT INTO REISE (reise_id, titel, zielort, startdatum, enddatum, preis)
VALUES
('K001', 'R001'),
('K002', 'R002'),
('K003', 'R003');
