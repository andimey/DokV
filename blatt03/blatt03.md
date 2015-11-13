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

*Quellen*
* [Wikipedia](https://de.wikipedia.org/wiki/Verarbeitungsanweisung)
* [xmlplease.com](http://www.xmlplease.com/xml/xmlname/pi)

a) **Identifizieren Sie im obigen XML-Beispiel die Processing Instructions (PI)! Woraus bestehen PIs und wozu dienen sie?**

PIs:
```
  <?xml-stylesheet type="text/xsl" href="businesscard.xsl"?>
```

```
  <?html-signature ... ?>
```

keine PIs:

```
  <?xml version="1.0" encoding="UTF-8"?>
```

PIs bestehen aus :
 * öffnendem "<?"
 * Namen (Target)
 * optional: Datenteil
 * schließendem "?>"

 Sie werden verwendet um Instruktionen an die Applikation zu übermitteln.

```
  <?Name Daten?>
```

b) **Welche Einschränkungen gibt es bezüglich der Benennung des Targets? An welchen Stellen im Dokument dürfen PIs erscheinen?**

 * Ohne (('X' | 'x') ('M' | 'm') ('L' | 'l') (offensichtlich auch kein ?)
 * Dürfen an jeder Stelle nach dem Header erscheinen

---
## Aufgabe 13: XLST-Verarbeitung
Schreiben Sie für die in Aufgabe 10 von Blatt 2 (Landkreise) erstellte XML-Datei ein XSLT-Stylesheet, dass die Elemente der XML-Datei in eine HTML-Ausgabe umwandelt. Das HTML-Dokument soll wie folgt strukturiert werden:


	Landkreise in Sachsen-Anhalt

	Landkreis
	* KFZ-Kennzeichen
	* Kreisstadt (Längengrad, Beitengrad)

	Landkreis ...
	...

Wie wird das Stylesheet verarbeitet? In welcher Reihenfolge werden die einzelnen Template abgearbeitet?
Hinweis: Mit Hilfe von XSLT-Prozessoren wie Xalan kann man die Aufrufreihenfolge der Template während der Stylesheet-Verarbeitung ausgeben lassen (hier mit der Option "-TT").
Was passiert, wenn ein XSLT-Stylesheet keine Templat-Regeln beinhaltet? Wie sieht dann das Ergebnis aus?


	<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	  <xsl:output omit-xml-declaration="yes" indent="yes"/>

	  <xsl:template match="/land/kreis">
	    <h2><xsl:value-of select="name"/></h2>
	    <ul>
	      <li><xsl:value-of select="@kfz"/></li>
	    </ul>
	  </xsl:template>

	  <xsl:template match="/land/stadt">
	    <ul>
	      <li><xsl:value-of select="name"/>(<xsl:value-of
	select="@laenge"/>, <xsl:value-of select="@breite"/>)</li>
	    </ul>
	  </xsl:template>
	</xsl:stylesheet>

	<!--
	  a.
	    Templates werden abwechselnd, bzw. Je nach Auftreten kreis/stadt
	angewandt
	  b.
	    Das Ergebnis sollte dann leer sein.
	-->
