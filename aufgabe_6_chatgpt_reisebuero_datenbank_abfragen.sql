-- Projektion
-- 1.1 Einfache Abfrage: Auswahl der Reise-Titel und deren Preis

-- Zeigt den Titel und den Preis jeder Reise an.
SELECT titel, preis
FROM REISE;

-- 1.2 Mittelschwere Abfrage: Auswahl der Kundennamen und E-Mails

-- Zeigt die Namen der Kunden und ihre E-Mail-Adressen an.
SELECT name, email
FROM KUNDE;

-- 1.3 Komplexere Abfrage: Auswahl der Namen der Reiseleiter*innen und ihrer Teams

-- Zeigt die Namen der Reiseleiter*innen und die Namen der Teams, denen sie zugeordnet sind.
SELECT REISELEITUNG.name, TEAM.name AS team_name
FROM REISELEITUNG
JOIN TEAM ON REISELEITUNG.leiter_id = TEAM.leiter_id;

-- Selektion
-- 2.1 Einfache Abfrage: Reisen mit einem Preis über 1000 Euro

-- Zeigt alle Reisen an, deren Preis höher als 1000 Euro ist.
SELECT titel, preis
FROM REISE
WHERE preis > 1000;

-- 2.2 Mittelschwere Abfrage: Kunden, deren Name mit "M" beginnt

-- Zeigt alle Kunden an, deren Name mit dem Buchstaben "M" beginnt.
SELECT name, email
FROM KUNDE
WHERE name LIKE 'M%';

-- 2.3 Komplexere Abfrage: Reisen, die nach dem 01. Juli 2024 beginnen und mindestens 5 Tage dauern

-- Zeigt alle Reisen an, die nach dem 1. Juli 2024 beginnen und mindestens 5 Tage dauern.
SELECT titel, startdatum, enddatum
FROM REISE
WHERE startdatum > '2024-07-01'
AND (julianday(enddatum) - julianday(startdatum)) >= 5;

-- Joins
-- 3.1 Einfache Abfrage: Namen der Kunden und die Titel der von ihnen gebuchten Reisen

-- Zeigt die Namen der Kunden und die Titel der Reisen, die sie gebucht haben.
SELECT KUNDE.name, REISE.titel
FROM KUNDE
JOIN REISE ON KUNDE.kundennummer = REISE.reise_id;

-- 3.2 Mittelschwere Abfrage: Reiseleiter*innen und die zugehörigen Reisen

-- Zeigt die Namen der Reiseleiter*innen und die Titel der Reisen, die sie begleiten.
SELECT REISELEITUNG.name, REISE.titel
FROM REISELEITUNG
JOIN REISE_REISELEITUNG ON REISELEITUNG.leiter_id = REISE_REISELEITUNG.leiter_id
JOIN REISE ON REISE_REISELEITUNG.reise_id = REISE.reise_id;

-- 3.3 Komplexe Abfrage: Kunden, die eine Reise gebucht haben, und ihre Reiseleiter*innen

-- Zeigt die Namen der Kunden, die eine Reise gebucht haben, und die Reiseleiter*innen, die diese Reisen begleiten.
SELECT KUNDE.name AS kunde_name, REISELEITUNG.name AS reiseleiter_name, REISE.titel
FROM KUNDE
JOIN REISE ON KUNDE.kundennummer = REISE.reise_id
JOIN REISE_REISELEITUNG ON REISE.reise_id = REISE_REISELEITUNG.reise_id
JOIN REISELEITUNG ON REISE_REISELEITUNG.leiter_id = REISELEITUNG.leiter_id;
