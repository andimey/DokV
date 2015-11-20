<!-- Dieser Code hat die Aufgabe nicht erfüllt, dient aber vielleicht als Ausgangslage für weitere Versuche-->
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/*">
    <xsl:apply-templates mode="children">
      <xsl:with-param name="pName" select="name()"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="*[*]" mode="children">
    <xsl:param name="pName"/>
    <xsl:variable name="vNewName" select="concat($pName, '/', name())"/>
    <xsl:value-of select="concat('/', $vNewName, '/&#10;')"/>
    <xsl:apply-templates mode="children">
      <xsl:with-param name="pName" select="$vNewName"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="*[not(*)]" mode="children">
    <xsl:param name="pName"/>
    <xsl:value-of select="concat('/', $pName, '/', name(), '/&#10;')"/> <br/>
  </xsl:template>

</xsl:stylesheet>
