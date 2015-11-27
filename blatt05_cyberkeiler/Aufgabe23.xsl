<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" version="2.0" encoding="UTF-8" indent="yes" />

  <xsl:template match="/">
    <rcp:collection xmlns:rcp="http://www.brics.dk/ixwt/recipes">
      <xsl:for-each select="rcp:recipe">
        Loop
        <xsl:value-of select="rcp:title" />
      </xsl:for-each>
    </rcp:collection>
  </xsl:template>
</xsl:stylesheet>
