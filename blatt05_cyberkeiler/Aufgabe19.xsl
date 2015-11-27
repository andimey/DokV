<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">

  <xsl:output method="text"/>

  <xsl:template match="/input">
    <xsl:for-each select="args">
      <xsl:call-template name="Fib">
        <xsl:with-param name="x" select="x"/>
      </xsl:call-template>
      <xsl:text>&#x0a;</xsl:text>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="Fib">
    <xsl:param name="x" />
    <xsl:choose>
      <xsl:when test="$x = 0">
        <xsl:text>0</xsl:text>
      </xsl:when>
      <xsl:when test="$x = 1">
        <xsl:text>1</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="Add">
          <xsl:with-param name="a1">
            <xsl:call-template name="Fib">
              <xsl:with-param name="x" select="$x -1"/>
            </xsl:call-template>
          </xsl:with-param>
          <xsl:with-param name="a2">
            <xsl:call-template name="Fib">
              <xsl:with-param name="x" select="$x -2"/>
            </xsl:call-template>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="Add">
    <xsl:param name="a1" />
    <xsl:param name="a2" />
    <xsl:value-of select="$a1 + $a2" />
  </xsl:template>

</xsl:stylesheet>
