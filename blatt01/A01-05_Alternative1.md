## Aufgabe 5: Inhaltsmodell
*Erstellen Sie drei Beispiele, die dem folgenden SGML-DTD-Fragment entsprechen (nehmen Sie an, dass die Inhaltsmodelle der in book enthaltenen Elemente jeweils (#PCDATA) sind*

``` <!element book - - ((editor|author)+, title+, subtitle*, ed?, series?, place, publ, year, isbn?, issn?, sign*, keyword*, url*, (comment? & note? & abstract?))>```

Endtags mal optional angenommen.

```
<book>
  <author> Andy Weir
  <title> The Martian </title>
  <subtitle> A Novel
  <place> USA
  <publ> BOWY
  <year> 2015
  <isbn> 978-1101905555
  <keyword> Fiction
  <keyword> Science Fiction
  <keyword> Action & Adventure
  <comment> "Brilliant…"--Wall Street Journal
</book>

<book>
  <author> Dr. Anton Hammer
  <author> Dr. Hildegard Hammer
  <author> Dr. Karl Hammer
  <title> Physikalische Formeln und Tabellen </title>
  <ed> 8
  <place> München
  <publ> Lindauer Verlag
  <year> 2002
  <isbn> 3-87488-182-2
  <keyword> Physik
  <keyword> Gymnasium
  <url>http://www.amazon.de/Physikalische-Formeln-Tabellen-Hammer/dp/3874881822
</book>

<book>
  <author> Figgen
  <author> Plath
  <author> Rothfischer </title>
  <title> Verkehrsflugzeuge
  <subtitle> Das neue Typen-Taschenbuch
  <place> München
  <publ> GeraMond Verlag
  <year> 2008
  <isbn> 978-3-7654-7011-0
  <url> http://geramon.de
  <note> Aktualisierte Neuausgabe!
</book>
```
