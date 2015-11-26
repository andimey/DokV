<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dokv="http://google.de" version="2.0">

  <xsl:template match="/input">
    <result>
    	<xsl:call-template name="dokv:ggT(n1,n2)">
    	</xsl:call-template>
    </result>
  </xsl:template>

  <!-- Konnte ich leider nicht testen, Parser war nicht XSLT 2.0 fähig-->
  <xsl:function name="dokv:ggT">
    <xsl:param name="num1"/>
    <xsl:param name="num2"/>
    <choose>
      <xsl:when test="$num2 = 0">
          <xsl:value-of select="$num1"/>
      </xsl:when>
      <xsl:when test="$num1 = 0">
          <xsl:value-of select="$num2"/>
      </xsl:when>
      <xsl:when test="$num1 &gt; $numb">
        <xsl:value-of select="dokv:ggT(($num1 - $num2),$num2)"/>
      </xsl:when>
      <xsl:otherwise>
         <xsl:value-of select="dokv:ggT($num1, ($num2 - $num1))"/>
      </xsl:otherwise>
    </choose>
  </xsl:function>

</xsl:stylesheet>
