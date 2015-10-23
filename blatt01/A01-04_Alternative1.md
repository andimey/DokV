## Aufgabe 4: Minimierung
Kann man bei den folgenden Beispielen entscheiden, ob es sich um
potentiell gültige SGML-Dokumente handelt, ohne dass SGML-Deklaration
und DTD bekannt sind?

a) ```< a >< b >< a >< b >```

b) ```< a >< /a >< b >< /b >```

c) ```< a >< a >< /a >< /b >```

d) ```< a >< b >< /a >< b >```

e) ```< b >< /a >< a >< c >< /b >< b >```


Definieren Sie, falls möglich, für jede der Konstruktionen eine DTD, die diese zulässt. Die Elemente < a >, < b > und < c > sollen dabei von einem Wurzelelement < test > umschlossen werden, dessen Start- und Endetag vorhanden sein müssen.

*Vorbemerkung:*
FÜR ALLE BEISPIELE WÜRDE AUCH GELTEN: -> dann aber nichtmehr eindeutig
```
<!DOCTYPE test [
  <!ELEMENT test - - (a|b|c)+ >
  <!ELEMENT a o o (#PCDATA) >
  <!ELEMENT b o o (#PCDATA) >
  <!ELEMENT c o o (#PCDATA) >
]>
```

a) ja
```
<!DOCTYPE test [
  <!ELEMENT test - - (a|b)+ >
  <!ELEMENT a - o (#PCDATA) >
  <!ELEMENT b - o (#PCDATA) >
]>
```
b) ja
```
<!DOCTYPE test [
  <!ELEMENT test - - (a,b) >
  <!ELEMENT a - - (#PCDATA) >
  <!ELEMENT b - - (#PCDATA) >
]>
```


c) ja, dann aber nichtmehr eindeutig zuzuordnen. z.B. ```<a>Hallo Welt</b>```
```
<!DOCTYPE test [
  <!ELEMENT test - - (a|b)+ >
  <!ELEMENT a - o (#PCDATA) >
  <!ELEMENT b o - (#PCDATA) >
]>
```

d) ja gültig. Eindeutig auflösbar auch ohne ```</b>```:

```
<!DOCTYPE test [
  <!ELEMENT test - - (a,b) >
  <!ELEMENT a - - (b) >
  <!ELEMENT b - O (#PCDATA) >
]>
```

e) sh. Universal DTD am Dokumentenanfang

oder:
```
<!DOCTYPE test [
  <!ELEMENT test - - (b)+ >
  <!ELEMENT a o o (c)* >
  <!ELEMENT b - o (a)* >
  <!ELEMENT c - o (#PCDATA) >
]>
```
