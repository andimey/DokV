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
 * Das Quelldokument wird knotenweise abgearbeitet. Die Verarbeitung beginnt dabei mit dem Wurzelknoten ("/")
 * Abarbeitung:
 ```
 <discography>
  <album>
    <artist>
    <title>
    <tracklist>
      <track>
      <track>
      <track>
      <track>
      <track>
      <track>
      <track>
      <track>
    <label>
    <year>
    <edi:price>
  ```
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
* `<xsl:template match="track">` Suche nach einem Match "track"
* `<xsl:value-of select="."/>` Ausgabe des aktuellen Taginhaltes

---

```
<?xml version="1.0"?>
<xsl:stylesheet version ="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <xsl:value-of select="/"/>
     </xsl:template>
</xsl:stylesheet>
```
* Das Quelldokument wird knotenweise abgearbeitet. Die Verarbeitung beginnt dabei mit dem Wurzelknoten ("/"). Im Anschluss wird die Knotenmenge ausgegeben.
* Abarbeitung:
```
<discography>
 <album>
   <artist>
   <title>
   <tracklist>
     <track>
     <track>
     <track>
     <track>
     <track>
     <track>
     <track>
     <track>
   <label>
   <year>
   <edi:price>
 ```
* Ausgabe:
Jackson Browne Late for the sky Late for the sky Fountain of sorrow Farther on The late show The road and the sky For a dancer Walking slow Before the deluge Elektra/Asylum 1974 32.18

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
* `<xsl:apply-templates select="//track"/>` Suche nach einem Match in der 3. Ebende unter dem root-Verzeichnis
* Ausgabe:
Late for the skyFountain of sorrowFarther onThe late showThe road and the skyFor a dancerWalking slowBefore the deluge

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
* Ausgabe:
Late for the skyFountain of sorrowFarther onThe late showThe road and the skyFor a dancerWalking slowBefore the deluge Jackson Browne Late for the sky Late for the sky Fountain of sorrow Farther on The late show The road and the sky For a dancer Walking slow Before the deluge Elektra/Asylum 1974 32.18

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
* `<xsl:apply-templates />` Das Node Set wird Element für Element abgearbeitet und jeweils eine entsprechende Template Rule gesucht. Dabei wird das aktuelle Element im Node Set zum Current Node des Prozesses.
* Ausgabe:
Jackson Browne Late for the sky Late for the sky Fountain of sorrow Farther on The late show The road and the sky For a dancer Walking slow Before the deluge Elektra/Asylum 1974 32.18
