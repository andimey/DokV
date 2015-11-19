* Iterationen mit <xsl:for-each>
```
<xsl:for-each select="list/eintrag">
  <tr>
    <td><xsl:value-of select="titel"/></td>
    <td><xsl:value-of select="descr"/></td>
  </tr>
  </xsl:for-each>
```

* Verzweigung mit Bedingung <xsl:if>
```
<xsl:for-each select="list/eintrag">
  <xsl:if test="prio &lt; 0">
    <tr>
      <td><xsl:value-of select="prio"/></td>
      <td><xsl:value-of select="test"/></td>
      <td><xsl:value-of select="descr"/></td>
    </tr>
  </xsl:if>
</xsl:for-each>
```

* Verzweigung mit alternativen Bedingung <xsl:choose>
```
<xsl:for-each select="list/eintrag">
    <tr>
      <xsl:choose>
        <xsl:when test="prio = 2">
          <td bgcolor="#ff0000">IMPORTANT</td>
        </xsl:when>
        <xsl:otherwise>
          <td>NORMAL</td>
        </xsl:otherwise>
      </xsl:choose>
      <td><xsl:value-of select="test"/></td>
      <td><xsl:value-of select="descr"/></td>
    </tr>
</xsl:for-each>
```

* Verweigung über Templates?

  Wird nur für die Einträge ausgeführt, auf die das Template zutrifft. Somit könnte es auch als Verzweigung betrachtet werden...

  ```
    <xsl:template match="/">
      <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="category">
      Template für Kategorien
    </xsl:template>

    <xsl:template match="othercategory">
      Template für andere Kategorie
    </xsl:template>
  ```
