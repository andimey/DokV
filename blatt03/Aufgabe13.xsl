<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output omit-xml-declaration="yes" indent="yes"/>

  <xsl:template match="/land/kreis">
    <h2><xsl:value-of select="name"/></h2>
    <ul>
      <li><xsl:value-of select="@kfz"/></li>
    </ul>
  </xsl:template>

  <xsl:template match="/land/stadt">
    <ul>
      <li><xsl:value-of select="name"/>(<xsl:value-of select="@laenge"/>, <xsl:value-of select="@breite"/>)</li>
    </ul>
  </xsl:template>
</xsl:stylesheet>

<!--
  a.
    Templates werden abwechselnd, je nach auftreten von match angewandt
  b.
    Das Ergebnis sollte dann leer sein.
-->
