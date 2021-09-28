# Neues Git Repo für die DLUG Webseite

## Verzeichnisstruktur

* `site` enthält die aktuelle Webseite, welche vom Webserver angezeigt werden soll
* Das Homeverzeichnis des Projekts beinhaltet die Quellcodes der Webseiten.
* `bin` beinhaltet das Binary des statischen Webseiten-Generators `aswsg` (Linux, Intel Version).

## Webseite bearbeiten

Sofern nur der Inhalt der bestehenden Seiten geändert werden soll,
muss nur die entsprechende Seiten-Datei `.pg` oder 
das passende Include `.in` geändert werden.

Für Änderungen der Verzeichnisstruktur muss die `header.in`
Datei angepasst werden.

### Struktur einer Seite

Eine Seite beginnt immer mit der Definition eines Namens:
```
@page:<name>
```
Der Name wird verwendet, um den passenden Menüeintrag 
hervorzuheben und erscheint im Titel.
Danach muss der Kopf der Seite eingebunden werden:
```
+header.in
```

Achtung! Wenn du eine Unterseite (archiv oder projekte)
bearbeitetst must du die `+` include-Dateien mit als
relativen pfad mit `../` angeben, also z. B. 
 `+../header.in`. 
Das Gleiche gilt auch für *article-end.in* und *footer.in*!

Der Inhalt einer Seite besteht aus einem oder 
mehreren `$<article>` ... `$</article>` Gruppen. 
Vor dem abschließenden `$</article>` muss eine Leerzeile sein, 
um den vorherigen Paragraph zu beenden.
Der abschließende Paragraph kann auch durch das Include `+article-end.in`
ersetzt werden. Damit kann das am Ende eines Artikels durch Variablen
das Änderungsdatum (last_change), der/die Autor[in|en] (author) 
und eine Lizenz (license) genannt werden. 
Das Include löscht am Ende die Variablen, um eine automatische 
Vererbung auf Folgeartikel zu verhindern.

Innerhalb eines Artikels wird mit Überschriftebene 3 begonnen.

Beispiel eines Artikel-Aufbaus:
```
$<article>
=== Überschrift Ebene 3 
Lorem Ipsum dolor.

==== Überschrift Ebene 4
Sed diam nonumy eirmod tempor invidunt
ut labore et dolore magna 
aliquyam erat, sed diam voluptua.

=== Überschrift für Eine Liste
* Aus mehreren Punkten
* Mit etwas Inhalt
* Ohne Sinn 

@last_change:2021-09-08
@author:Marlene Muster
@license:CC BY 4.0
+article-end.in
```

Ein Artikel kann auch gut in ein Include geschrieben werden.

Am Ende der Seite wird der Fuß eingebunden.
```
footer.in
```

## Neue Webseite generieren 

Einfach das Shellscript `make.sh` im Projektverzeichnis ausführen. 
Dieses aktualisiert das `site` Verzeichnis.

## Testen der Webseite

Wegen der Unterverzeichnisse und relativen Pfade must du einen lokalen
Webserver aus dem `site` Verzeichnis des Repos starten. 
Das ist total einfach, z.B. mit:

### Caddy

1. Installiere das [Caddy](https://caddyserver.com/v2) Binary aus deiner Paketverwaltung,
   oder schaue [hier](https://caddyserver.com/docs/install).
2. Starte caddy mit `caddy file-server -listen :8910`

### Python

* `python[3] -m http.server 8910`

oder

* `python[2] -m SimpleHTTPServer 8910`

### Node.js

* Installiere http-server mit `npm install -g http-server`
* Starte den Server mit `http-server -p 8910`

### darkhttpd

* siehe [darkhttpd](https://unix4lyfe.org/darkhttpd/)

### ngrok

Mit [ngrok](https://ngrok.com/) kannst du die Seite sogar aus dem Internet testen.

### pagekite

[pagekite](https://pagekite.net/) bietet, wie ngrok, eine öffentliche URL.  

### sonstiges

Natürlich geht auch der Apache httpd, nginx und andere.
Das Setup ist nur evtl. aufwendiger. 

## Webseite veröffentlichen

Ein `git push` sollte reichen.

**WIP!** Der Server hat ein Hook, welcher die den Webserver mit 
den Inhalten des `site` Verzeichnisses aktualisiert.
