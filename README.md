# Neues Git Repo für die DLUG Webseite

## Verzeichnisstruktur

* `site` enthält die aktuelle Webseite, welche vom Webserver angezeigt werden soll
* Das Homeverzeichnis des Projekts beinhaltet die Quellcodes der Webseiten.
* `bin` beinhaltet das Binary des statischen Webseiten-Generators `aswsg` (Linux, Intel Version).
* Andere Unterverzeichnisse bilden die Unterseiten der Webseite ab.

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

Achtung! Wenn du eine Unterseite (in *archiv* oder *projekte*)
bearbeitetest musst du die `+` include-Dateien mit als
relativen Pfad mit `../` angeben, also z. B.
 `+../header.in`.
Das Gleiche gilt auch für `+article-end.in` und `+footer.in`!

Der Inhalt einer Seite besteht aus einem oder
mehreren `$<article>` ... `+article-end.in` Gruppen.
Das Include `+article-end.in` fügt am Ende eines Artikels einen Footer
ein, der die folgenden Variablen anzeigt, sofern diese gefüllt sind:
* @last_change:<YYYY-MM-DD> - Datum der letzten Änderung
* @author:<Name> - Name der Autorin oder des Autors bzw. der Autoren
* @license:<Lizenz> - Lizenzangabe, z. B. "CC BY 4.0"
Das Include löscht am Ende die Variablen, um eine automatische
Weitergabe auf Folgeartikel zu verhindern.

Wenn keine der Variablen gefüllt ist, kann der Artikel auch ohne das
Include `+article-end.in` durch ein `$</article>` abgeschlossen
werden. Vor dem `$</article>` muss eine Leerzeile sein, um den
vorherigen Paragraph zu beenden.

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

## Links

Links können schnell im Gemini Format `=> URL [TEXT]` geschrieben werden.
Diese werden als <li> Elemente in einer Liste dargestellt.
Beispiel:
```
=> https://media.ccc.de/ CCC Video Archiv von Vorträgen
```

 *Interne* Links sollten in der Form `[[text|URL]]` angegeben werden.
Zum Beispiel so:
```
[[Mailing-Liste|kontakt.html#Mailingliste]]
```

 *Externe* Links sollten in der Form `[text](URL)` definiert werden,
dann wird im erzeugten HTML das Attribut `rel=external` hinzugefügt.
Zum Beispiel so:
```
[Wikipedia](https://www.wikipedia.de/)
```


## Neue Webseite generieren

Einfach das Shellscript `make.sh` im Projektverzeichnis ausführen.
Dieses aktualisiert das `site` Verzeichnis.

Bitte beachte, dass das Script das `aswsg` aus dem Verzeichnis
`bin` nimmt. Dieses ist für _Linux AMD64_
kompiliert.
Solltest du auf einer anderen Plattform arbeiten
schaue [hier](https://github.com/Kulbartsch/AStaticWebSiteGenerator)
nach deiner passenden Version.


## Testen der Webseite

Wegen der Unterverzeichnisse und relativen Pfade musst du einen lokalen
Webserver aus dem `site` Verzeichnis des Repos starten.
Das ist total einfach, z.B. mit:

### Caddy

1. Installiere das [Caddy](https://caddyserver.com/v2) Binary aus
   deiner Paketverwaltung,
   oder schaue [hier](https://caddyserver.com/docs/install).
2. Im Terminal wechsel in das das site Verzeichnis `.../DLUG-website/site`.
3. Starte caddy mit `caddy file-server --listen :8910`
4. Öffne die lokale DLUG-Webseite mit [http://localhost:8910](http://localhost:8910).

(Du kannst den Port 8910 natürlich durch einen Anderen ersetzen.)

### Python

Alternativ für Python als Webserver, ersetze Schritt 3 mit:

* `python[3] -m http.server 8910`

oder

* `python[2] -m SimpleHTTPServer 8910`

### Node.js

Alternativ für den node.js http-server als Webserver, ersetze Schritt 1 mit:

* Installiere http-server mit `npm install -g http-server`

Und Schritt 3 mit:

* Starte den Server mit `http-server -p 8910`

### darkhttpd

* siehe [darkhttpd](https://unix4lyfe.org/darkhttpd/)

### ngrok

Mit [ngrok](https://ngrok.com/) kannst du die Seite sogar aus dem Internet testen.

### pagekite

[pagekite](https://pagekite.net/) bietet, wie ngrok, eine öffentliche URL.

### sonstiges

Natürlich geht auch der Apache httpd, nginx und andere.
Das Setup ist evtl. aufwendiger.

## Webseite veröffentlichen

Ein `git push` sollte reichen.

**WIP!** Der Server hat ein Hook, welcher die den Webserver mit
den Inhalten des `site` Verzeichnisses aktualisiert.
