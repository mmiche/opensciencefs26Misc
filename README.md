# opensciencefs26Misc

## 2026-03-03

Öffne GitHubManuell.pdf

Transformiere rmd (oder z.B. auch qmd) Datei in R-Skript:
Führe Befehl knitr::purl(Dateiname) in R-Konsole aus, wobei Dateiname der Dateiname mit Endung in Anführungszeichen im Befehl stehen muss.

Beispiel: Datei ist Gemeinsamkeiten20260212.rmd
knitr::purl("Gemeinsamkeiten20260212.rmd")

Je nachdem in welches Format ein rmd-Dokument überführt (kompiliert) wird, lassen sich verschiedene Optionen nutzen. Beispiel index.rmd im Ordner docs: Bei html Kompilierung lässt sich der Code in einzelne Tabs aufteilen, was der Übersichtlichkeit bei umfangreichem Code dienen kann.

Einige Tipps und Tricks rund um die Nutzungsmöglichkeiten von rmarkdown:

https://posit.co/blog/r-markdown-tips-tricks-1-rstudio-ide/

https://posit.co/blog/r-markdown-tips-tricks-2-cleaning-up-your-code/

https://posit.co/blog/r-markdown-tips-and-tricks-3-time-savers/

https://posit.co/blog/r-markdown-tips-tricks-4-looks-better-works-better/

Anleitung, um Tab-separierten Code direct als Webseite anzeigen zu lassen:

1. Lege Ordner docs an.
2. Lege Dateien index.rmd und index.html in docs Ordner.
3. Auf GitHub website, im Repository, klicke Settings, dann Pages, dann ändere zu "main" und "docs".
4. Warte bis die Webseite eingerichtet worden ist (kann einige Minuten dauern).