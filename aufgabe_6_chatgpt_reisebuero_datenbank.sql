-- Tabelle für Reisen
CREATE TABLE IF NOT EXISTS REISE (
    reise_id TEXT PRIMARY KEY,
    titel TEXT NOT NULL,
    zielort TEXT NOT NULL,
    startdatum TEXT NOT NULL,
    enddatum TEXT NOT NULL,
    preis REAL NOT NULL
);

-- Tabelle für Kunden
CREATE TABLE IF NOT EXISTS KUNDE (
    kundennummer TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    adresse TEXT NOT NULL,
    telefonnummer TEXT,
    email TEXT NOT NULL
);

-- Tabelle für Reiseleitungen
CREATE TABLE IF NOT EXISTS REISELEITUNG (
    leiter_id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    geburtsdatum TEXT NOT NULL,
    gehalt REAL NOT NULL
);

-- Tabelle für Teams
CREATE TABLE IF NOT EXISTS TEAM (
    teamnummer TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    standort TEXT NOT NULL,
    leiter_id TEXT,
    FOREIGN KEY (leiter_id) REFERENCES REISELEITUNG(leiter_id)
);

-- Tabelle für Stationen
CREATE TABLE IF NOT EXISTS STATION (
    laufende_nummer INTEGER PRIMARY KEY,
    datum TEXT NOT NULL,
    ort TEXT NOT NULL,
    kurzbeschreibung TEXT,
    reise_id TEXT,
    FOREIGN KEY (reise_id) REFERENCES REISE(reise_id)
);

-- Tabelle für Reiseveranstalter
CREATE TABLE IF NOT EXISTS REISEVERANSTALTER (
    name TEXT PRIMARY KEY,
    adresse TEXT NOT NULL,
    telefonnummer TEXT NOT NULL
);

-- Tabelle für die n:m Beziehung zwischen Reisen und Reiseleitungen
CREATE TABLE IF NOT EXISTS REISE_REISELEITUNG (
    reise_id TEXT,
    leiter_id TEXT,
    PRIMARY KEY (reise_id, leiter_id),
    FOREIGN KEY (reise_id) REFERENCES REISE(reise_id),
    FOREIGN KEY (leiter_id) REFERENCES REISELEITUNG(leiter_id)
);
