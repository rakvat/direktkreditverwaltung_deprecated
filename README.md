Direktkreditverwaltung
======================

Nach Erfordernissen eines Mietshäuser Syndikat Projekts.

Verwaltet
* Kontaktdaten
* Verträge
* Buchungen (in Planung)

Erstellt
* Kontoauszüge
* Zinsberechnungen
* Vertragsübersicht nach Auslaufdatum

Import
* von Kontakten 
** rake import:contacts[/path/to/csv_file.csv]
* Buchungseinträgen möglich
** rake import:accounting_entries[/path/to/csv_file.csv]
(benötigtes Format der csv-Dateien ist in lib/tasks/import.rake beschrieben)

Geplant sind 
* unterschiedliche Auswertungsansichten
* automatische Dokumentenerstellung

