-- Tabelle für Landessprache
CREATE TABLE Zielort (
    Zielort VARCHAR(100) PRIMARY KEY,
    Landessprache VARCHAR(50) NOT NULL
);

-- Tabelle für Entität "Externer_Reiseveranstalter"
CREATE TABLE Externer_Reiseveranstalter (
    ReiseveranstalterNr INTEGER PRIMARY KEY AUTOINCREMENT, -- AUTOINCREMENT, da es somit einfacher ist, einen "unique"-Wert zu haben.
    Name VARCHAR(100) NOT NULL,
    Postleitzahl VARCHAR(15) NOT NULL,
    Straße VARCHAR(50) NOT NULL,
    Hausnummer VARCHAR(10) NOT NULL
);

-- Tabelle für Entität "Reise"
CREATE TABLE Reise (
    ReiseNr INTEGER PRIMARY KEY AUTOINCREMENT, -- AUTOINCREMENT, da es somit einfacher ist, einen "unique"-Wert zu haben.
    Titel TEXT NOT NULL,
    Preis FLOAT NOT NULL, --FLOAT, da Gleitkommazahlen dargestellt werden sollen.
    Startdatum DATE, --"NOT NULL wird ausgelassen, da Reise auch ohne Start- und Enddatum angelegt werden soll."
    Enddatum DATE, --"NOT NULL wird ausgelassen, da Reise auch ohne Start- und Enddatum angelegt werden soll."
    Zielort TEXT NOT NULL,
    ReiseveranstalterNr INTEGER OPTIONAL,
    FOREIGN KEY (Zielort)
      REFERENCES Zielort(Zielort),
    FOREIGN KEY (ReiseveranstalterNr)
      REFERENCES Externer_Reiseveranstalter(ReiseveranstalterNr)
);

-- Tabelle für Entität "Kunde"
CREATE TABLE "Kunde" (
    KundenNr INTEGER PRIMARY KEY AUTOINCREMENT, -- AUTOINCREMENT, da es somit einfacher ist, einen "unique"-Wert zu haben.
    Vorname VARCHAR(50) NOT NULL,
    Nachname VARCHAR(50) NOT NULL,
    Telefonnummer VARCHAR(20), --"NOT NULL wird ausgelassen, da die Telefonnummer optional sein soll."
    E_Mail_Adresse TEXT NOT NULL,
    Postleitzahl VARCHAR(15) NOT NULL,
    Straße VARCHAR(50) NOT NULL,
    Hausnummer VARCHAR(10) NOT NULL,
    ReiseNr INTEGER,
    FOREIGN KEY (ReiseNr)
      REFERENCES Reise(ReiseNr)
      ON DELETE CASCADE
      ON UPDATE NO ACTION
);

-- Tabelle für Entität "Team"
CREATE TABLE Team (
    TeamNr INTEGER PRIMARY KEY AUTOINCREMENT, -- AUTOINCREMENT, da es somit einfacher ist, einen "unique"-Wert zu haben.
    Name VARCHAR(50) NOT NULL,
    Standort VARCHAR(50) NOT NULL
);

-- Tabelle für Entität "Reiseleitung"
CREATE TABLE Reiseleitung (
    ReiseleiterNr INTEGER PRIMARY KEY AUTOINCREMENT, -- AUTOINCREMENT, da es somit einfacher ist, einen "unique"-Wert zu haben.
    Vorname VARCHAR(50) NOT NULL,
    Nachname VARCHAR(50) NOT NULL,
    Geburtsdatum DATE NOT NULL,
    Gehalt FLOAT NOT NULL,
    TeamNr INTEGER,
    FOREIGN KEY (TeamNr)
      REFERENCES Team(TeamNr)
        ON DELETE CASCADE
        ON UPDATE NO ACTION
);

-- Tabelle für Entität "Station"
CREATE TABLE Station (
    lfdStationNr INTEGER, -- kein AUTOINCREMENT möglich, da hier ein zusammengesetzter Primärschlüssel vorhanden sein muss
    ReiseNr INTEGER,
    Datum DATE NOT NULL,
    Ort VARCHAR(50) NOT NULL,
    Kurzbeschreibung TEXT,
    PRIMARY KEY (lfdStationNr, ReiseNr),
    FOREIGN KEY (ReiseNr)
      REFERENCES Reise(ReiseNr)
        ON DELETE CASCADE
        ON UPDATE NO ACTION
);

-- Tabelle für Entität "Externer_Reiseveranstalter_Telefonnummer"
CREATE TABLE Externer_Reiseveranstalter_Telefonnummer (
    Telefonnummer VARCHAR(20),
    ReiseveranstalterNr INTEGER,
    PRIMARY KEY (Telefonnummer, ReiseveranstalterNr),
    FOREIGN KEY (ReiseveranstalterNr)
       REFERENCES Externer_Reiseveranstalter(ReiseveranstalterNr)
          ON DELETE CASCADE
          ON UPDATE NO ACTION
);

-- Darstellung von Relation zwischen "Reiseleitung" und "Reise", in Relationenmodell dargestellt als "begleitet"
CREATE TABLE reise_reiseleitung (
    ReiseNr INTEGER,
    ReiseleiterNr INTEGER,
    PRIMARY KEY (ReiseNr, ReiseleiterNr),
    FOREIGN KEY (ReiseNr)
      REFERENCES Reise(ReiseNr)
      ON DELETE CASCADE
      ON UPDATE NO ACTION,
    FOREIGN KEY (ReiseleiterNr)
      REFERENCES Reiseleitung(ReiseleiterNr)
      ON DELETE CASCADE
      ON UPDATE NO ACTION
);

-- Tabelle für Teamleitung (ein Reiseleiter ist Chef eines Teams)
CREATE TABLE Teamleitung (
    ReiseleiterNr_B INTEGER,
    ReiseleiterNr_V INTEGER,
    PRIMARY KEY (ReiseleiterNr_B, ReiseleiterNr_V),
    FOREIGN KEY (ReiseleiterNr_B)
      REFERENCES Reiseleitung(ReiseleiterNr)
      ON DELETE CASCADE
      ON UPDATE NO ACTION,
    FOREIGN KEY (ReiseleiterNr_V)
      REFERENCES Reiseleitung(ReiseleiterNr)
        ON DELETE CASCADE
        ON UPDATE NO ACTION
);

-- Tabelle für Entität "Reiseleitung_Sprache"
CREATE TABLE Reiseleitung_Sprache (
    Sprache TEXT NOT NULL,
    ReiseleiterNr INTEGER,
    PRIMARY KEY (Sprache, ReiseleiterNr),
    FOREIGN KEY (ReiseleiterNr)
      REFERENCES Reiseleitung(ReiseleiterNr)
        ON DELETE CASCADE
        ON UPDATE NO ACTION
);
