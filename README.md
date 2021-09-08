# Neues Git Repo für die DLUG Webseite

## Verzeichnisstruktur

* `archive` enthält alte, nicht mehr verwendete Dateien
    * Ressourcen wie CSS und Bilder sind in entsprechenden Unterverzeichnissen abgelegt. 
* `site` enthält die aktuelle Webseite, welche vom Webserver angezeigt werden soll
* Das Homeverzeichnis des Projekts beinhaltet die eigentlichen Webseiten.

## Webseite bearbeiten

Sofern nur der Inhalt der bestehenden Seiten geändert werden soll,
muss nur die entsprechende `.pg`-Datei geändert werden.

Für Änderungen der Verzeichnisstruktur muss die `header.in`
Datei angepasst werden.

`footer.in` beinhaltet den Fuß Text am Ende jeder Seite.

## Neue Webseite generieren 

Einfach das Shellscript `make.sh` im Projektverzeichnis ausführen. 
Dieses aktualisiert das *site* Verzeichnis.

## Webseite veröffentlichen

Ein `git push` sollte reichen.

Der Server hat ein post-receive Hook, welcher die den Webserver mit 
den Inhalten des *site* Verzeichnisses aktualisiert.


 *EOF*
