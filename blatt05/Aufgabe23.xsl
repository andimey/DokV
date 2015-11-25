<!--
In der hinterlegten XML-Datei sind Kochrezepte gespeichert.

Schreiben Sie ein XSLT-Stylesheet, das mit diesen Daten das folgende tut:
Der Inhalt aller Rezept-Titel soll als upper case ausgegeben werden
Alle Attribute sollen gelöscht und stattdessen als Elemente gespeichert werden.
Am Ende der Ausgabe soll es eine Übersicht darüber geben, welche Maßeinheiten (units) in den Rezepten verwendet und welche Zutaten in diesen Einheiten gemessen werden.
Greifen Sie hierfür auf XSLT 2.0-Funktionen wie xsl:function und grouping zurück.

Beispielausgabe (minimal):
<?xml version="1.0" encoding="UTF-8"?>
<rcp:collection xmlns:rcp="http://www.brics.dk/ixwt/recipes">
  <rcp:description>
     Some recipes used in the XML tutorial.
  </rcp:description>
<rcp:recipe id="r101">
    <rcp:title>BEEF PARMESAN WITH GARLIC ANGEL HAIR PASTA</rcp:title>
    <rcp:date>Fri, 28 May 04</rcp:date>
    <rcp:ingredient>
      <rcp:name>beef cube steak</rcp:name>
      <rcp:amount>1.5</rcp:amount>
      <rcp:unit>pound</rcp:unit>
    </rcp:ingredient>

    <rcp:ingredient>
      <rcp:name>onion, sliced into thin rings</rcp:name>
      <rcp:amount>1</rcp:amount>
    </rcp:ingredient>

    ...

    <rcp:preparation>
      <rcp:step>
        Preheat oven to 350 degrees F (175 degrees C).
      </rcp:step>
      <rcp:step>
        Cut cube steak into serving size pieces. Coat meat with the bread crumbs
        and parmesan cheese. Heat olive oil in a large frying pan, and saute 1
        teaspoon of the garlic for 3 minutes. Quick fry (brown quickly on both sides)
        meat. Place meat in a casserole baking dish, slightly overlapping edges.
        Place onion rings and peppers on top of meat, and pour marinara sauce
        over all.
      </rcp:step>

      ...

    </rcp:preparation>
    <rcp:comment>
      Make the meat ahead of time, and refrigerate over night, the acid in the
      tomato sauce will tenderize the meat even more. If you do this, save the
      mozzarella till the last minute.
    </rcp:comment>
    <rcp:nutrition calories="1167" fat="23%" carbohydrates="45%" protein="32%">
      <rcp:calories>1167</rcp:calories>
      <rcp:fat>23%</rcp:fat>
      <rcp:carbohydrates>45%</rcp:carbohydrates>
      <rcp:protein>32%</rcp:protein>
    </rcp:nutrition>

    ...
     </rcp:recipe>
    <rcp:unit_overview>
      <unit>pound
        <rcp:name>beef cube steak</rcp:name>
        <rcp:name>ricotta cheese</rcp:name>
        <rcp:name>small salad shrimp</rcp:name>
        ...
      </unit>
      ...<rcp:collection
    </rcp:unit_overview>
 </rcp:collection>
 -->
