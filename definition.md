# Definitionen und pot. Prüfungsfragen
!Potentielle/Sichere Prüfungsfragen mit ! markiert
## Wohlgeformt
 * öffnende UND schließende Targets
 -> keine Minimierung
 * ein Wurzelelement
 * keine Überlappung von Tags
 -> "Was heißt das?"" BAUMSTRUKTUR!
 * Attributwerte in Quotes eingeschlossen

## Entitäten
 * Beginnen mit &
 * z.B. & quot;

## DTD
### Attribute
    <!ATTLIST element attname CDATA #IMPLIED>
    <!ATTLIST element attname CDATA #REQUIRED>
    <!ATTLIST element attname CDATA #FIXED>
    <!ATTLIST element attname CDATA (foo|bar) "baz">

**An der Stelle von CDATA kann stehen:**
  * CDATA -> Character Datenhaltung
  * ENTITY
  * ENTITIES
  * ID (darf nicht mit Zahl anfangen)
  * IDREF (wie Fremdschlüssel)
  * NMTOKEN ->
  * NMTOKENS (Liste von NMTOKEN)
  * NOTATIONS (verweise auf anderes Dokument)
  z.B. gif src ...
  * Alternative (x|y)

## XML
### 5 Stichwörter
 * Wohlgeformtheit
 * Baumstruktur
  * Knotenarten
 * Validität
 * Keine Minimierung (vgl. mit SGML)
 * DTD

### XML Preamble
```
<?xml version="1.0" encoding="UTF-8"?>
```
--> keine Processing Instruction
### ! Valide vs. Wohlgeformt
 * wohlgeformt = XML alleine ist wohlgeformt
 * valide = XML Erfüllt/entspricht einer Struktur (vorrausgesetzt: wohlgeformt)

### !!! 7 XML Knotentypen
*die Wesentlichen in Prüfung ausreichend*
 * Root node (Wurzelknoten/Dokumentwurzel):
   Dieser darf nicht mit dem Wurzelelement selbst verwechselt werden. Vielmehr ist dieser der virtuelle Elternknoten (parent node) des Wurzelelements.
 * Element node (Elementknoten)
 * Attribute node (Attributknoten)
 * Text node (Textknoten)
 * Namespace node (Namensraumknoten)
 * Processing instruction node    (Verarbeitungsanweisungsknoten)
 * Comment node (Kommentarknoten)

#### Processing Instructions
```
  <?Target Data?>
```
 * eigene Targetname dürfen nicht mit xml beginnen. (XML Prozessor ignoriert alle Targets die nicht mit "xml" beginnen)
 * XML Preamble ist keine PI

 Bsp.:
 ```
   <?php ... ?>
 ```

## XSLT Verarbeitung
*Ziel:* XML-Baumstrukturen in Baumstrukturen umwandeln.

### Templates
* Werden für gewöhnlich nach Import Reihenfolge gewichtet
* Manuelle Gewichtung möglich

#### default templates
Werden aufgerufen wenn im Stylesheet selbst kein template anzuwenden ist.
 * default Template für Elementknoten:
  * ruft Templates für die Kinderknoten auf
 * default Template für Attribute:
  *

### Zeichen
* **```//knotenname``` = ```descendants::knotenname```**

  Alle Nachfahren des Typs 'knotenname' vom aktuellen Knoten aus

* ```*//knotenname```
* ```.``` Der aktuelle Standpunkt (ich inklusive)
* ```*``` Alle Kinder (ich exklusive)

### ! Sprachmittel um Iterationen und Verzweigungen in XLST zu realisieren

 * ```<xsl:if test="XPATH AUSDRÜCKE"></xsl:if>```
 *
