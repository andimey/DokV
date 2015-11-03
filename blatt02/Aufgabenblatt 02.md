#Aufgabenblatt 02
## Aufgabe 6
Ändern Sie die hinterlegte XML-Datei so ab, dass sie den Regeln für wohlgeformte XML-Dokumente (XML wellformedness rules) genügt.
Ihre Einreichung wird automatisch auf Wohlgeformtheit überprüft.
[Document](notwellformed.xml)

---

## Aufgabe 7
 1. Wie werden laut XML-Spezifikation Attribute definiert und wie werden diese Attribute in einer DTD verwendet? Was sind ihre möglichen Werte und Bedeutungen?

 2. Daten können in XML-Dokumenten als Inhalt von Kind-Knoten oder als Knotenattribute gespeichert werden. In den folgenden Beispielen ist der gleiche Inhalt auf unterschiedliche Weise -- mittels Kindknoten oder Attributen -- gespeichert.

### Beispiel 1

 <note date="12/11/2002">
  <to>Tove</to>
  <from>Jani</from>
  <heading>Reminder</heading>
  <body>Don't forget me this weekend!</body>
</note>

### Beispiel 2
<note>
  <date>12/11/2002</date>
  <to>Tove</to>
  <from>Jani</from>
  <heading>Reminder</heading>
  <body>Don't forget me this weekend!</body>
</note>

### Beispiel 3
<note>
  <date>
    <day>12</day>
    <month>11</month>
    <year>2002</year>
  </date>
  <to>Tove</to>
  <from>Jani</from>
  <heading>Reminder</heading>
  <body>Don't forget me this weekend!</body>
</note>

### Beispiel 4
<note day="12" month="11" year="2002"
to="Tove" from="Jani" heading="Reminder"
body="Don't forget me this weekend!">
</note>

Alle vier Beispiele enthalten exakt die gleichen Informationen. Diskutieren Sie die Vor- und Nachteile der Nutzung von Elementen und Attributen zur Datenhaltung in den vier Beispielen. Welche Probleme können auftreten, wenn Daten als Attribute gespeichert werden?

---

## Aufgabe 8
Erstellen Sie eine XML-DTD für Ausschreibungen von Themen (für Praktika, Master Thesis u. ä.). Unter anderem sollte die DTD die Auszeichnung des Themenstellers, des Titels und einer Beschreibung vorsehen. Über ein Attribut sollte man auch angeben können, um welche Art von Arbeit (Praktika, Master Thesis usw.) es sich handelt.

Erstellen Sie ein Beispieldokument, das gemäß dieser DTD ausgezeichnet ist. Validieren Sie dieses Dokument, entweder mit Hilfe eines lokal installierten XML-Parsers, oder über einen Web-Validierungsservice, z. B. den Validator des W3C.


Für die Einreichung und die Validierung im Web ist es u. U. nötig, dass Sie die DTD in das Dokument einbetten.

---

## Aufgabe 9
Welche Knoten kann ein XML-Dokument beinhalten? Geben Sie als Beispiel ein XML-Dokument an, welches alle möglichen Knoten innerhalb einer XML-Baumstruktur beinhaltet.

---

## Aufgabe 10
Erstellen Sie ein XML-Dokument, welches Informationen zu den Landkreisen und Kreisstädten sowie den kreisfreien Städten von Sachsen-Anhalt beinhaltet. Verwenden Sie folgende Elemente und Attribute:

*<!ELEMENT land     (kreis|stadt)*>

*<!ELEMENT kreis            (name)>

<!ELEMENT stadt            (name)>

<!ELEMENT name          (#PCDATA)>

<!ATTLIST kreis kfz    CDATA #REQUIRED>

<!ATTLIST stadt kreis  CDATA #REQUIRED>

<!-- Angaben zur geografischen Laenge und Breite (dezimaler Form) -->

<!ATTLIST stadt breite CDATA #REQUIRED>

<!ATTLIST stadt laenge CDATA #REQUIRED>*