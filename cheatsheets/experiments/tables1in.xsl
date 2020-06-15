<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="xml"/>

  <xsl:template match="tables-container">
	<xsl:processing-instruction name="xml-stylesheet">type="text/xsl" href="tables1out.xsl"</xsl:processing-instruction>
	<tables-container>
	  <xsl:apply-templates />
	</tables-container>
  </xsl:template>

  <xsl:template match="table/tbody">
	<list>
	  <record-def>
		<name><xsl:apply-templates select="tr/th"/></name>	
	  </record-def>
	  <contents>
		<xsl:apply-templates select="tr[position() != 1]"/>
	  </contents>
	</list>
  </xsl:template>

  <xsl:template match="tr">
	<item>
	  <record-def>
		<name><xsl:value-of select="td[position() != 1]"/></name>
		<field type="key-sequence"><xsl:apply-templates select="td[position() =1]"/></field> 
	  </record-def>
	</item>
  </xsl:template>

  <xsl:template match="tr/th">
	<xsl:value-of select="normalize-space()"/> 
  </xsl:template>

  <xsl:template match="td/tt">
	<xsl:value-of select="."/> 
  </xsl:template>

  <xsl:template match="td">
	<xsl:value-of select="normalize-space()"/> 
  </xsl:template>

  <xsl:template match="text()"/>
</xsl:stylesheet>