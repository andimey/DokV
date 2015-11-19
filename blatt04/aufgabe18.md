# Aufgabe 18: Verzweigung und Steuerelemente

**Welche Sprachmittel stellt XSLT zur Verfügung um Verzweigungen und Iterationen zu realisieren? Geben Sie jeweils ein Beispiel für die Anwendung an!**

## Bedingte Abarbeitung

* Einfacher Test ohne Alternative:

 ```
 <xsl:if test="Bedingung">
  Anweisungen
 </xsl:if>
 ```

 * Beispiel:
 ```
 <xsl:if test="idee">
  <em>eingesandt von:
  <xsl:apply-templates select="idee" /></em>
 </xsl:if>
 ```
Nur wenn es (wenigstens) ein Kindelement idee gibt, werden der Text "eingesandt von:" erzeugt und diese Kinder anschließend abgearbeitet.

* Auswahl aus mehreren Möglichkeiten
```
<xsl:choose>
  <xsl:when test="Bedingung1">
    Anweisungen
  </xsl:when>
  <xsl:when test="Bedingung2">
    Anweisungen
  </xsl:when>
  <xsl:otherwise>
    Anweisungen
  </xsl:otherwise>
</xsl:choose>
```
Es muss wenigstens ein xsl:when geben. Alle anderen Zweige sind optional. xsl:otherwise darf nur an letzter Stelle stehen.

 * Beispiel:
 ```
 <xsl:value-of select="position()"/>
 <xsl:choose>
   <xsl:when test="position()=1">st</xsl:when>
   <xsl:when test="position()=2">nd</xsl:when>
   <xsl:when test="position()=3">rd</xsl:when>
   <xsl:otherwise>th</xsl:otherwise>
 </xsl:choose>
 ```
 ... erzeugt abhängig von der Position des aktuellen Knotens eine der Ausgaben 1st, 2nd, 3rd, 4th, 5th, ...

## Wiederholte Ausführung
* For-Each Schleife  
```
<xsl:for-each select="Knotenmenge">
  Anweisungen
</xsl:for-each>
```
 * Beispiel:
 ```
 <xsl:template match="zutaten">
  <ul>
    <xsl:for-each select="zutat">
      <li><xsl:value-of select="." /></li>
    </xsl:for-each>
  </ul>
</xsl:template>
```
xsl:for-each bestimmt eine neue Knotenmenge, aus der dann jeweils der Kontextknoten für die Anweisungen im Inneren genommen wird.
