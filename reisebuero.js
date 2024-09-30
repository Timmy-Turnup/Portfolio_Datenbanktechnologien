erDiagram
    Kunde {
        int KundenNr PK
        string Vorname
        string Nachname
        int Postleitzahl
        string Strasse
        int Hausnummer
        string E-Mail_Adresse
        string Telefonnummer "optionale Telefonnummer"
        string ReiseNr FK
    }
    Reise {
        string ReiseNr PK
        string Titel
        float Preis
        date Startdatum
        date Enddatum
        string Zielort FK
        string ReiseveranstalterNr FK
    }
    Zielort {
        string Zielort PK
        string Landessprache
    }
    Externer_Reiseveranstalter {
        int ReiseveranstalterNr PK
        string Name
        int Postleitzahl
        string Strasse
        int Hausnummer
    }
    Externer_Reiseveranstalter_Telefonnummer {
        int Telefonnummer PK
        int ReiseveranstalterNr PK, FK
    }
    Station {
        int lfdStationNr PK
        int ReiseNr PK, FK
        date Datum
        string Ort
        string Kurzbeschreibung
    }
    Team {
        int TeamNr PK
        string Name
        string Standort
    }
    Reiseleitung {
        int ReiseleiterNr PK
        string Vorname
        string Nachname
        date Geburtsdatum
        float Gehalt
        string Vorgesezter
        string Beaufsichtiger
        string TeamNr FK
    }
    Reiseleitung_Sprache {
        int Sprache PK
        int ReiseleiterNr PK, FK
    }


    Reise ||--o{ Kunde : bucht
    Reise ||--|{ Station : hat
    Reise |{--o| Externer_Reiseveranstalter : organisiert
    Reiseleitung |{--|| Team : organisiert_in
    Reiseleitung }|--|{ Reise : begleitet
    Reiseleitung ||--|{ Reiseleitung : Teamleitung
    Zielort ||--|{ Reise : besitzt
    Reiseleitung_Sprache |{--|| Reiseleitung : spricht
    Externer_Reiseveranstalter ||--|{ Externer_Reiseveranstalter_Telefonnummer : hat
