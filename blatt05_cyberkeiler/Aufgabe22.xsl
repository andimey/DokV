<?xml version="1.0" encoding="UTF-8"?>
<!-- Algorithmus von http://snipplr.com/view/5170/pythagorean-triples-generator/ in XLST überführt -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dokv="http://google.de" version="2.0">
<xsl:output method="xml" />

<xsl:template match="/pythago">
  <param name="x">
    <xsl:value-of select="/pythago/limit">
  </param>
	<xsl:value-of name="dokv:getTripel($x,1)" />
</xsl:template>


<xsl:function name="dokv:getTripel">
	<xsl:param name="limit"/>
	<xsl:param name="m"/>

  <xsl:when test="m &lt;limit"/>
    <pTriple>
        <x><xsl:value-of select="$m *2 +1"></x>
        <y><xsl:value-of select="$m *2 * ($m +1)"></y>
        <z><xsl:value-of select="($m *2) * ($m +1) +1"></z>
    </pTriple>
    <xsl:value-of name="dokv:getTripel($limit, $m +1)" />
	</xsl:when>
</xsl:function>

</xsl:stylesheet>
