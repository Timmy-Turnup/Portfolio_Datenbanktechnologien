-- Abfragen zu "Projketion"

-- Namen aller Reiseveranstalter alphabetisch sortiert sollen angezeigt werden:
SELECT
  ReiseveranstalterNr,
  Name
FROM
  Externer_Reiseveranstalter
ORDER BY
  Name ASC;

-- Namen und Gehälter aller Reiseleiter sollen angezeigt werden (sortiert nach dem Gehalt in abgesteigender Reihenfolge):
SELECT
  Vorname,
  Nachname,
  Gehalt
FROM
  Reiseleitung
ORDER BY
  Gehalt DESC;

-- Alle Kunden-E-Mail-Adressen sollen angezeigt werden (sinnvoll, wenn Angebote oder sonstige Werbung verschickt werden soll, jedoch darf eine gleiche Mail nicht zwei Mal angezeigt werden)
SELECT DISTINCT
  E_Mail_Adresse,
  Vorname,
  Nachname
FROM
  Kunde;

-- Alle Reisen sollen nach Startdatum aufsteigend sortieren werden.
SELECT
  Titel,
  Startdatum,
  Enddatum
FROM
  Reise
ORDER BY
  Startdatum ASC;

-- Alle Reisen sollen nach Preis aufsteigend sortieren werden.
SELECT
  ReiseNr,
  Titel,
  Preis,
  Startdatum,
  Enddatum,
  Zielort
FROM
  Reise
ORDER BY
  Preis ASC;

-- Abfragen zu "Selektion"

-- Alle Reisen mit einem Wert unter 1000 Euro sollen ausgewählt werden:
SELECT *
FROM
  Reise
WHERE
  Preis < 1000
  ORDER BY
    Preis ASC
Limit 3;

-- Die Gehälter der Reiseleitungen abfragen, welche über 3500 Euro liegen:
SELECT *
FROM
  Reiseleitung
WHERE
  Gehalt > 3500 OR Gehalt = 3500
ORDER BY
  Gehalt ASC;

-- Kunden abfragen, die keine Telefonnummer angegeben haben:
SELECT *
FROM
  Kunde
WHERE
    Telefonnummer IS NULL
ORDER BY
  Nachname ASC;

-- Alle Stationen auswählen, die zu einer Reise gehören:
SELECT *
FROM
  Station
WHERE
  ReiseNr = 4 AND Datum > '2024-08-06';

-- Die ersten 5 Reisen, die zwischen zwei bestimmten Daten stattfinden sollen angezeigt werden:
  SELECT *
  FROM
    Reise
  WHERE
    Startdatum BETWEEN '2024-05-01' AND '2024-08-31'
  LIMIT 3;

-- Abfragen zu "Joins"

-- Alle Stationen in einer bestimmten Reise sollen angezeigt werden, sortiert nach Stationsdatum:
SELECT
  Station.Ort,
  Station.Datum,
  Station.Kurzbeschreibung,
  Reise.ReiseNr,
  Reise.Titel,
  Reise.Zielort
FROM
  Station
INNER JOIN
  Reise ON Station.ReiseNr = Reise.ReiseNr
WHERE
  Reise.ReiseNr = 4
ORDER BY
  Station.Datum ASC;

-- Alle Kunden mit ihren jeweiligen Reisen, nach Reise und Nachname sortiert:
SELECT
  Kunde.Nachname,
  Kunde.Vorname,
  Reise.Titel AS ReiseTitel,
  Reise.ReiseNr,
  Reise.Zielort
FROM
  Kunde
INNER JOIN
  Reise ON Kunde.ReiseNr = Reise.ReiseNr
ORDER BY
  Reise.ReiseNr ASC,
  Kunde.Nachname ASC;

-- Reiseleiter, die mehr als eine Reise begleiten (wichtig, wenn man z.B. Auslastung der Mitarbeitenden prüfen möchte):
SELECT
  Reiseleitung.ReiseleiterNr,
  Reiseleitung.Nachname,
  Reiseleitung.Vorname,
  COUNT(reise_reiseleitung.ReiseNr) AS AnzahlReisen
FROM
  Reiseleitung
INNER JOIN
  reise_reiseleitung ON Reiseleitung.ReiseleiterNr = reise_reiseleitung.ReiseleiterNr
GROUP BY
  Reiseleitung.ReiseleiterNr HAVING COUNT(reise_reiseleitung.ReiseNr) > 1
ORDER BY
  Reiseleitung.Nachname ASC;

-- Überprüfung, ob bei jeder Reise auch ein Reiseleiter dabei ist, der die jeweilige Landessprache der Reise spricht:

SELECT
  Reise.ReiseNr,
  Reise.Titel,
  Zielort.Landessprache,
  Reiseleitung.ReiseleiterNr,
  Reiseleitung.Vorname,
  Reiseleitung.Nachname,
  Reiseleitung_Sprache.Sprache
  FROM
  	Reise
  INNER JOIN
    Zielort ON Reise.Zielort = Zielort.Zielort
  INNER JOIN
    reise_reiseleitung ON Reise.ReiseNr = reise_reiseleitung.ReiseNr
  INNER JOIN
    Reiseleitung ON reise_reiseleitung.ReiseleiterNr = Reiseleitung.ReiseleiterNr
  INNER JOIN
    Reiseleitung_Sprache ON Reiseleitung.ReiseleiterNr = Reiseleitung_Sprache.ReiseleiterNr
  WHERE
    Zielort.Landessprache = Reiseleitung_Sprache.Sprache;

-- Alle Reiseleiter mit ihren Teams und Vorgesetzten, nach Teamname und Nachname der Reiseleiter sortiert:
SELECT
  Reiseleitung.Vorname AS ReiseleiterVorname,
  Reiseleitung.Nachname AS ReiseleiterNachname,
  Team.Name AS TeamName,
  Vorgesetzter.Vorname AS VorgesetzterVorname,
  Vorgesetzter.Nachname AS VorgesetzterNachname
FROM
  Reiseleitung
INNER JOIN
  Team ON Reiseleitung.TeamNr = Team.TeamNr
LEFT JOIN
  Teamleitung ON Team.TeamNr = Teamleitung.ReiseleiterNr_V
LEFT JOIN
  Reiseleitung AS Vorgesetzter ON Teamleitung.ReiseleiterNr_B = Vorgesetzter.ReiseleiterNr
ORDER BY
  Team.Name ASC,
  Reiseleitung.Nachname ASC;
