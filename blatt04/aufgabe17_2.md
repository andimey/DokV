# Aufgabe 17: Anwendung von xsl:template

**Gegeben ist folgendes XML-Dokument:**

```
<?xml version="1.0"?>
<?xml-stylesheet type="text/css2" href="jbalbum.css"?>
<!-- Example  -->
<discography xmlns:edi="http://ecommerce.example.org/schema">
<album>
  <artist>Jackson Browne</artist>
  <title>Late for the sky</title>
  <tracklist>
    <track>Late for the sky</track>
    <track>Fountain of sorrow</track>
    <track>Farther on</track>
    <track>The late show</track>
    <track>The road and the sky</track>
    <track>For a dancer</track>
    <track>Walking slow</track>
    <track>Before the deluge</track>
  </tracklist>
  <label>Elektra/Asylum</label>
  <year>1974</year>
  <edi:price units='Euro'>32.18</edi:price>
 </album>
</discography>
```
**Erklären Sie was passiert, wenn die nachfolgenden XSL-Stylesheets verwendet werden! Wie sieht die Reihenfolge der Abarbeitung der Knoten im Dokument aus?**

```
<?xml version="1.0"?>
<xsl:stylesheet version ="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
    </xsl:template>
</xsl:stylesheet>
```
 * der Root Knoten wird mit allen Childs aufgerufen.
 * Reihenfolge:
  * discography (Namespaceknoten ignoriert)
  * album
  * artist
  * "Jackson Browne"
  * title
  * "Late for the sky"
  * tracklist
  * track
  * "Fountain of sorrow"
  * lable
  * ...
  * edi:price (Attribute sind keine echten Kinder, werden nicht aufgerufen)
  * "32.18"
---

```
<?xml version="1.0"?>
  <xsl:stylesheet version ="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:template match="/">
      </xsl:template>

      <xsl:template match="track">
          <xsl:value-of select="."/>
      </xsl:template>
  </xsl:stylesheet>
```
* der Root Knoten wird mit allen Childs aufgerufen.(Reihenfolge wie XML) Template track wird nicht ausgeführt (apply template fehlt)

---

```
<?xml version="1.0"?>
<xsl:stylesheet version ="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <xsl:value-of select="/"/>
     </xsl:template>
</xsl:stylesheet>
```
* der Root Knoten wird mit allen Childs aufgerufen und ausgegeben (Reihenfolge wie XML)

---
```
<?xml version="1.0"?>
<xsl:stylesheet version ="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <xsl:apply-templates select="//track"/>
     </xsl:template>

    <xsl:template match="track">
        <xsl:value-of select="."/>
    </xsl:template>
</xsl:stylesheet>
```
* der Root Knoten wird mit allen Childs aufgerufen und Textknoten ausgegeben. Handelt es sich dabei um einen track wird der Inhalt des Tracks ausgegeben.

---
```
<?xml version="1.0"?>
<xsl:stylesheet version ="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <xsl:apply-templates select="//track"/>
        <xsl:value-of select="/"/>
     </xsl:template>

    <xsl:template match="track">
        <xsl:value-of select="."/>
    </xsl:template>
</xsl:stylesheet>
```
* der Root Knoten wird mit allen Childs aufgerufen und ausgegeben (Reihenfolge wie XML).

  Für jeden Trackknoten wird der Inhalt ausgegeben.

  Danach werden alle Textknoten ausgegeben.

---
```
<?xml version="1.0"?>
<xsl:stylesheet version ="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <xsl:apply-templates />
     </xsl:template>

    <xsl:template match="track">
        <xsl:value-of select="."/>
    </xsl:template>
</xsl:stylesheet>
```
* der Root Knoten wird mit allen Childs aufgerufen und ausgegeben (Reihenfolge wie XML).
  Handelt es sich nicht um einen track-Knoten wird das default template verwendet und der Text ausgegeben. 
  Ansonsten wird für tracks der trackTemplate aufgerufen.
