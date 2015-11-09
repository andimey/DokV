#Aufgabenblatt 02
## Aufgabe 6
**Ändern Sie die hinterlegte XML-Datei so ab, dass sie den Regeln für wohlgeformte XML-Dokumente (XML wellformedness rules) genügt.
Ihre Einreichung wird automatisch auf Wohlgeformtheit überprüft.**

[Document](notwellformed.xml)
[Document](notwellformed2.xml)

---

## Aufgabe 7
 **1. Wie werden laut XML-Spezifikation Attribute definiert und wie werden diese Attribute in einer DTD verwendet? Was sind ihre möglichen Werte und Bedeutungen?**
 (https://wiki.selfhtml.org/wiki/XML/DTD/Attribute_und_Wertzuweisungen)
 Attribute werden im Element Tag durch Bezeichnung und Wert in Anführungszeichen definiert:
   <element attributname="attributwert">Text/Inhalt</element>

in der DTD werden sie so definiert:
  <!ELEMENT Elementname (Inhalt)>
  <!ATTLIST Elementname
     Attributname_1 Inhalt [#REQUIRED|#IMPLIED|#FIXED "Wert"|Defaultwert]
     Attributname_n Inhalt [#REQUIRED|#IMPLIED|#FIXED "Wert"|Defaultwert]
  >




 alle Attributwerte werden als String geschrieben und in
" ... " eingeschlossen

 **2. Daten können in XML-Dokumenten als Inhalt von Kind-Knoten oder als Knotenattribute gespeichert werden. In den folgenden Beispielen ist der gleiche Inhalt auf unterschiedliche Weise -- mittels Kindknoten oder Attributen -- gespeichert.**

### Beispiel 1

    <note date="12/11/2002">
      <to>Tove</to>
      <from>Jani</from>
      <heading>Reminder</heading>
      <body>Don't forget me this weekend!</body>
    </note>


 * Datum als Attribut
 * sonst alles in eigenen Elementen
 * u.U. nicht eindeutig in Bestandteile zerlegbar (Reihenfolge Monat Tag)

### Beispiel 2
    <note>
      <date>12/11/2002</date>
      <to>Tove</to>
      <from>Jani</from>
      <heading>Reminder</heading>
      <body>Don't forget me this weekend!</body>
    </note>

 * alle Daten in Elementen
 * u.U. nicht eindeutig in Bestandteile zerlegbar (Reihenfolge Monat Tag)

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

 * keine Attribute
 * alles in Elementen
 * Datum strukturiert in Unterknoten zerlegt gespeichert

### Beispiel 4
    <note day="12" month="11" year="2002"
    to="Tove" from="Jani" heading="Reminder"
    body="Don't forget me this weekend!">
    </note>
 * keine Kinderknoten mehr
 * alles in Attributen definiert -> schwer lesbar

**Alle vier Beispiele enthalten exakt die gleichen Informationen. Diskutieren Sie die Vor- und Nachteile der Nutzung von Elementen und Attributen zur Datenhaltung in den vier Beispielen. Welche Probleme können auftreten, wenn Daten als Attribute gespeichert werden?**

(http://www.w3schools.com/Xml/xml_dtd_el_vs_attr.asp)

Bsp 1: - Datum als Attribut, sonst alles in Elementen u.U. nicht eindeutig in Bestandteile zerlegbar (reihenfolge Monat Tag)
Bsp 2: - keine Attribute, alles in Elementen aber Datum u.U. nicht eindeutig in Bestandteile zerlegbar
Bsp 3: - keine Attribute, alles in Elementen und Datum zerlegt
Bsp 4: - keine Kinderknoten mehr, alles in Attributen definiert, schwer lesbar

Generelles Problem beim Verpacken von allen Daten ins Attribute:
Irgendwann kein sinnvolle Kindknoten mehr bildbar. Schwer zu lesen und damit zu arbeiten. Sinvoll ist daher nur reine Datenverarbeitungshinweise als Attribute zu definieren, also keinen zu speichernden Daten selbst.

Weitere Probleme mit Attributen (nach W3C):
 * Attribute können keinen multiplen Werte enhalten (mehrere Kinderknoten)
 * lassen sich schwer erweitern
 * können keine Struktur beschreiben (verschachtelte Elemente/Kinderknoten)
 * Attributen sind schwieriger per Programmcode zu ändern
 * Attribute lassen sich nicht so einfach mit der vorgegebene DTD vergleichen

---

## Aufgabe 8
**Erstellen Sie eine XML-DTD für Ausschreibungen von Themen (für Praktika, Master Thesis u. ä.). Unter anderem sollte die DTD die Auszeichnung des Themenstellers, des Titels und einer Beschreibung vorsehen. Über ein Attribut sollte man auch angeben können, um welche Art von Arbeit (Praktika, Master Thesis usw.) es sich handelt.**

**Erstellen Sie ein Beispieldokument, das gemäß dieser DTD ausgezeichnet ist. Validieren Sie dieses Dokument, entweder mit Hilfe eines lokal installierten XML-Parsers, oder über einen Web-Validierungsservice, z. B. den Validator des W3C.**


**Für die Einreichung und die Validierung im Web ist es u. U. nötig, dass Sie die DTD in das Dokument einbetten.**

    <?xml version="1.0"?>
    <!DOCTYPE thema[
      <!ELEMENT thema (themensteller|titel|description)*>
      <!ATTLIST thema
        typ (BachelorThesis|MasterThesis|Praktika) #REQUIRED
      >    
      <!ELEMENT themensteller (#PCDATA)>
      <!ELEMENT titel (#PCDATA)>
      <!ELEMENT description (#PCDATA)>
    ]>
    <thema typ="MasterThesis">
     <themensteller>Auszeichnung Fragensteller</themensteller>
     <titel>Thementitel</titel>
     <description>Themenbeschreibung</description>
    </thema>

Alternative:

    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE tender[
      <!ELEMENT tender (topic,author,info)>
      <!ATTLIST tender
        type CDATA #REQUIRED
      >    
      <!ELEMENT topic (#PCDATA)>
      <!ELEMENT author (#PCDATA)>
      <!ELEMENT info (#PCDATA)>
    ]>
    <tender type="praktikum">
     <topic>Praktikum Entwicklung Motorsteuerung</topic>
     <author>Volkswagen</author>
     <info>Anforderungen und Grundvoraussetzungen
      Damit Sie bei Volkswagen ein Praktikum absolvieren können, müssen Sie an einer Hochschule immatrikuliert sein und dürfen Ihr Studium noch nicht abgeschlossen haben.
      Ausgenommen hiervon ist selbstverständlich das Grundpraktikum, das für viele Studiengänge bereits vorab notwendig ist.
      </info>
    </tender>

---

## Aufgabe 9
**Welche Knoten kann ein XML-Dokument beinhalten? Geben Sie als Beispiel ein XML-Dokument an, welches alle möglichen Knoten innerhalb einer XML-Baumstruktur beinhaltet.**

* Root node (Wurzelknoten): Dieser darf nicht mit dem Wurzelelement selbst verwechselt werden. Vielmehr ist dieser der virtuelle Elternknoten (parent node) des Wurzelelements.
* Element node (Elementknoten)
* Attribute node (Attributknoten)
* Text node (Textknoten)
* Namespace node (Namensraumknoten)
* Processing instruction node (Verarbeitungsanweisungsknoten)
* Comment node (Kommentarknoten)


<!-- Wurzelknoten: Virtueller Elternknoten des Wurzelelements root -- >
<root>
  <element attribut="Das Attribut">Textknoten</element>
  <element attribut="Anderes Attribut">weiterer Textknoten</element>
</root>

      <?xml version="1.0" encoding="UTF-8"?>
      <EUROPA>
        <LAND>
          <NAME>Deutschland</NAME>
          <EINWOHNERZAHL EINHEIT="Millionen">82.4</EINWOHNERZAHL>
          <HAUPTSTADT>Berlin</HAUPTSTADT>
          <KFZ-KENNZEICHEN>D</KFZ-KENNZEICHEN>
          <TEL-VORWAHL>0049</TEL-VORWAHL>
        </LAND>
        <LAND>
          <NAME>Frankreich</NAME>
          <EINWOHNERZAHL EINHEIT="Millionen">58.5</EINWOHNERZAHL>
          <HAUPTSTADT>Paris</HAUPTSTADT>
          <KFZ-KENNZEICHEN>F</KFZ-KENNZEICHEN>
          <TEL-VORWAHL>0033</TEL-VORWAHL>
        </LAND>
        <LAND>
            <NAME>Spanien</NAME>
            <EINWOHNERZAHL EINHEIT="Millionen">39.4</EINWOHNERZAHL>
            <HAUPTSTADT>Madrid</HAUPTSTADT>
            <KFZ-KENNZEICHEN>E</KFZ-KENNZEICHEN>
            <TEL-VORWAHL>0034</TEL-VORWAHL>
            </LAND>
      </EUROPA>


---

## Aufgabe 10
**Erstellen Sie ein XML-Dokument, welches Informationen zu den Landkreisen und Kreisstädten sowie den kreisfreien Städten von Sachsen-Anhalt beinhaltet. Verwenden Sie folgende Elemente und Attribute:**

    <!ELEMENT land     (kreis|stadt)>
    <!ELEMENT kreis            (name)>
    <!ELEMENT stadt            (name)>
    <!ELEMENT name          (#PCDATA)>
    <!ATTLIST kreis kfz    CDATA #REQUIRED>
    <!ATTLIST stadt kreis  CDATA #REQUIRED>
    <!-- Angaben zur geografischen Laenge und Breite (dezimaler Form) -->
    <!ATTLIST stadt breite CDATA #REQUIRED>
    <!ATTLIST stadt laenge CDATA #REQUIRED>

Lösung:
[aufgabe10.xml](aufgabe10.xml)

    <land>
      <kreis kfz="JL">
        <name>Jerichower Land</name>
      </kreis>
      <stadt kreis="Jerichower Land" breite="52.269722" laenge="11.854722">
        <name>Burg</name>
      </stadt>

      <kreis kfz="MD">
        <name>Magdeburg</name>
      </kreis>
      <stadt kreis="Magdeburg" breite="52.133333" laenge="11.616667">
        <name>Magdeburg</name>
      </stadt>

      <kreis kfz="BK">
        <name>Börde</name>
      </kreis>
      <stadt kreis="Börde" breite="52.290583" laenge="11.412945">
        <name>Haldensleben</name>
      </stadt>

      <kreis kfz="SAW">
        <name>Altmarkkreis Salzwedel </name>
      </kreis>
      <stadt kreis="Altmarkkreis Salzwedel">
        <name>Salzwedel</name>
      </stadt>
    </land>
