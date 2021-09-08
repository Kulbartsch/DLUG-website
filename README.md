# Neues Git Repo für die DLUG Webseite

## Verzeichnisstruktur


* `site` enthält die aktuelle Webseite, welche vom Webserver angezeigt werden soll
* Das Homeverzeichnis des Projekts beinhaltet die Quellcodes der Webseiten.
* `bin` beinhaltet das Binary des statischten Webseiten-Generators `aswsg` (Linux, Intel Version).

## Webseite bearbeiten

Sofern nur der Inhalt der bestehenden Seiten geändert werden soll,
muss nur die entsprechende Seiten-Datei `.pg` oder 
das passende Include `.in` geändert werden.

Für Änderungen der Verzeichnisstruktur muss die `header.in`
Datei angepasst werden.

`footer.in` beinhaltet den Fuß Text am Ende jeder Seite.

## Neue Webseite generieren 

Einfach das Shellscript `make.sh` im Projektverzeichnis ausführen. 
Dieses aktualisiert das `site` Verzeichnis.

## Webseite veröffentlichen

Ein `git push` sollte reichen.

Der Server hat ein Hook, welcher die den Webserver mit 
den Inhalten des `site` Verzeichnisses aktualisiert.


