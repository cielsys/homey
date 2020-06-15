<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="xml" />
  
  <xsl:template match="tables-container">
	<xsl:processing-instruction name="xml-stylesheet">type="text/xsl" href="tables2out.xsl"</xsl:processing-instruction>
	<tables-container>
	  <xsl:apply-templates select="table"/>
	</tables-container>
  </xsl:template>

  <xsl:template match="table">
	<list>
	  <record-def>
		<name><xsl:value-of select="preceding-sibling::h2[1]"/></name>	
	  </record-def>
	  <contents>
		<xsl:apply-templates select="tbody/tr"/>
	  </contents>
	</list>
  </xsl:template>

  <xsl:template match="tr">
	<item>
	  <record-def>
		<name><xsl:apply-templates mode="cmd-desc" select="td[position() = 1]"/></name>
		<xsl:apply-templates select="td[position() !=1]"/>
	  </record-def>
	</item>
  </xsl:template>

  <xsl:template match="td">
	<field type="key-sequence"><xsl:value-of select="normalize-space()"/></field>  
  </xsl:template>

  <xsl:template mode="cmd-desc" match="td">
	<xsl:value-of select="normalize-space()"/> 
  </xsl:template>

  <xsl:template match="text()"/>

</xsl:stylesheet>
