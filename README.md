Direktkreditverwaltung
======================

Nach Erfordernissen eines Mietshäuser Syndikat Projekts.

Verwaltet
* Kontaktdaten
* Verträge
* Buchungen

Erstellt
* Kontoauszüge
* Zinsberechnungen
* Vertragsübersicht nach Auslaufdatum

Import
* von Kontakten 
    * rake import:contacts[/path/to/csv_file.csv]
* Buchungseinträgen möglich
    * rake import:accounting_entries[/path/to/csv_file.csv]
(benötigtes Format der csv-Dateien ist in lib/tasks/import.rake beschrieben)

latex-Ausgabe
* z.B. die Zinsauswertung lässt sich im latex-Format ausgeben. Diese kann dann gespeichert, modifiziert und mit latex, dvipdfm, ... weiter verarbeitet werden
* es wurde kein pdf-export gewählt, um die Möglichkeit der latex-Datei-Manipulation zu bewahren
* Templates für die Zinsbriefe befinden sich in /app/views/layouts und /app/views/contracts . Sie enden auf "_template". Kopiere die _template-Dateien in Dateien mit gleichem Namen jedoch ohne "_template" und ändere die die Dateien wo nötig.
* Parameter für dvipdfm: -p a4 (Papiergröße), -l (Landscape mode für Dankesbriefe) 

Geplant sind 
* Unterstützung für veränderte Direktkreditverträge (Zinssatzänderung)
* Graphen

