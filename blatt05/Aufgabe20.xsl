<?xml version="1.0"?>
<!--
Aus AuD ist Ihnen wahrscheinlich auch die Ackermann-Funktion bekannt. Sie lässt sich wie folgt definieren:
  A(0, y) := y + 1
  A(x, 0) := A(x - 1, 1)
  A(x, y) := A(x - 1, A(x, y - 1))

Implementieren Sie die Ackermann-Funktion als XSLT-Template. Verwenden Sie dafür den vorgegebenen Rahmen.

Wie lange benötigt Ihr XSLT-Prozessor (welcher?) auf Ihrem Rechner (was für einer?) für die Berechnung von A(3, 5)?
xsltproc - ~1 Sekunden????
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">

  <xsl:output method="text"/>

  <xsl:template match="/input">
    <xsl:for-each select="args">
      <xsl:call-template name="A">
        <xsl:with-param name="x" select="x"/>
        <xsl:with-param name="y" select="y"/>
      </xsl:call-template>
      <xsl:text>&#x0a;</xsl:text>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="A">
    <xsl:param name="x" />
    <xsl:param name="y" />

    <xsl:choose>
      <xsl:when test="$x = 0">
        <xsl:value-of select="$y +1"/>
      </xsl:when>
      <xsl:when test="$y = 0">
        <xsl:call-template name="A">
          <xsl:with-param name="x" select="$x -1"/>
          <xsl:with-param name="y" select="1"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>

        <xsl:call-template name="A">
          <xsl:with-param name="x" select="$x -1"/>

          <xsl:with-param name="y">
            <xsl:call-template name="A">
              <xsl:with-param name="x" select="$x"/>
              <xsl:with-param name="y" select="$y -1"/>
            </xsl:call-template>
          </xsl:with-param>

        </xsl:call-template>

      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
