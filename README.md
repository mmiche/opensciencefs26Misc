# opensciencefs26Misc

## 2026-03-03

Öffne GitHubManuell.pdf

Transformiere rmd (oder z.B. auch qmd) Datei in R-Skript:
Führe Befehl knitr::purl(Dateiname) in R-Konsole aus, wobei Dateiname der Dateiname mit Endung in Anführungszeichen im Befehl stehen muss.

Beispiel: Datei ist Gemeinsamkeiten20260212.rmd
knitr::purl("Gemeinsamkeiten20260212.rmd")

Je nachdem in welches Format ein rmd-Dokument überführt (kompiliert) wird, lassen sich verschiedene Optionen nutzen. Beispiel Gemeinsamkeiten20260227.rmd: Bei html Kompilierung lässt sich der Code in einzelne Tabs aufteilen, was der Übersichtlichkeit bei umfangreichem Code dienen kann.