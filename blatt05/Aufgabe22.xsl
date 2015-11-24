<!--
XSLT: Pythagoreische Tripel

Als pythagoreische Tripel werden jene drei Zahlen (x,y,z) bezeichnet, die die Formel x^2 + y^2 = z^2 erfüllen.

Schreiben Sie eine XSLT-Datei, die für den XML-Input

<?xml version="1.0" encoding="UTF-8"?>
<pythago>
	<limit>100</limit>
</pythago>
eine XML-Datei erzeugt, die alle pythagoreischen Tripel bis zum angegeben Limit (z=Limit) erzeugt. Der Ouput soll wie folgt aussehen:
<?xml version="1.0" encoding="UTF-8"?>
<pythagTriples>
    <pTriple>
        <x>3</x>
        <y>4</y>
        <z>5</z>
    </pTriple>
    ...
</pythagTriples>
Auch diese Transformation soll mit Hilfe von xsl:function realisiert werden.

(Ihre Einreichung wird auf Wohlgeformtheit überprüft.)
-->

<xsl:stylesheet version="2.0">

<xsl:variable name="tripel">
    <input>
        <x>1</x>
        <y>2</y>
		<limit>100</limit>
    </input>
</xsl:variable>

<xsl:template match="input">
	<xsl:call-template name="fun:tripel(x,y)">
	</xsl:call-template>
</xsl:template>


<xsl:function name="fun:tripel(x1,y1)">
	<xsl:param mane="a"/>
	<xsl:param mane="b"/>
	<xsl:param mane="c"/>
	<xsl:when test="($x1=0)or(%y1=0)">
		<result>
			<xsl:text>error</xsl:text>
		</result>
	</xsl:when>
<xsl:when>
	<xsl:if test="a&lt;limit"/>
				<xsl:value-of select="fun:tripel(a=x1^2-y1^2)"/>
				<xsl:value-of select="fun:tripel(b=2*x1*y1)"/>
				<xsl:value-of select="fun:tripel(c=x1^2+y1^2)"/>
		</xsl:when>
<otherwise>
	<xsl:if test="a&gt;limit"/>
		<result>
			<xsl:value-of select="a"/>
			<xsl:value-of select="b"/>
			<xsl:value-of select="c"/>
		</result>
		</otherwise>
</xsl:function>
</xsl:stylesheet>
