## Aufgabe 11: Wettervorhersage
Unter http://www.wetteronline.de/Sachsen-Anhalt/Magdeburg.htm finden Sie die Wettervorhersage für Magdeburg für die nächsten drei Tage.
Definieren Sie eine DTD, die Dokumente vom Typ weatherforecast beschreibt. Diese Beschreibung soll so präzise wie möglich sein.
Schreiben Sie ein XML-Dokument, das die Informationen der aktuellen Wettervorhersage für Magdeburg enthält. Das Dokument soll hinsichtlich Ihrer in a) festgelegten DTD valide sein.
Ihre Einreichung soll die XML-Datei mit intern definierter DTD enthalten. Die Wohlgeformtheit Ihrer XML-Datei wird automatisch überprüft.

@cyberkeiler Lösung:
[Aufgabe 11](Aufgabe11.xml)

## Aufgabe 12: Processing Instructions

```
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="businesscard.xsl"?>
<name>
	<given_name>Katrin</given_name>
	<surname>Krieger</surname>
	<title>M.A.</title>
	<e-mail>katrin.krieger@ovgu.de</e-mail>
	<office>G29-016</office>
	<phone type="office">0391-67 12510</phone>
	<group>Knowledge Based Systems and Language Processing</group>
	<department>Computer Science</department>
<?html-signature
--
Katrin Krieger, M.A.      Tel. +49 391 67 52510
<a href="http://edu.cs.uni-magdeburg.de/mitarbeiter/kkrieger">Homepage</a>
<a href="mailto:katrin.krieger@ovgu.de">E-Mail</a>
?>
</name>
```

a) **Identifizieren Sie im obigen XML-Beispiel die Processing Instructions (PI)! Woraus bestehen PIs und wozu dienen sie?**

b) **Welche Einschränkungen gibt es bezüglich der Benennung des Targets? An welchen Stellen im Dokument dürfen PIs erscheinen?**
