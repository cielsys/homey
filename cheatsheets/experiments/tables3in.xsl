<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="xml" />
  
  <xsl:template match="tables-container">
	<xsl:processing-instruction name="xml-stylesheet">type="text/xsl" href="tables3out.xsl"</xsl:processing-instruction>
	<ecs>
	  <xsl:apply-templates select="table"/>
	</ecs>
  </xsl:template>

  <xsl:template match="table">
	<cmd-grp>
	  <xsl:attribute name="cmd-family"><xsl:value-of select="preceding-sibling::h2[1]"/></xsl:attribute>	
	  <xsl:attribute name="pkg">emacs</xsl:attribute >
	  <cmd-table>
		<xsl:apply-templates select="tbody/tr/td/strong"/>
		<cmd-list>
		  <xsl:apply-templates select="tbody/tr"/>
		</cmd-list>
	  </cmd-table>
	</cmd-grp>
  </xsl:template>

  <xsl:template match="tbody/tr/td/strong">
	  <col-header><xsl:value-of select="."/></col-header>
  </xsl:template>
  
  <xsl:template match="tr">
	<xsl:variable name="is-header-row" select="td/strong"/>
	<xsl:if test="not($is-header-row)">
	  <cmd>
		<cmd-desc><xsl:apply-templates mode="cmd-desc" select="td[position() = 1]"/></cmd-desc>
		<xsl:apply-templates select="td[position() !=1]"/>
	  </cmd>
	</xsl:if>
  </xsl:template>

  <xsl:template match="td">
	<key-sequence><xsl:value-of select="normalize-space()"/></key-sequence>  
  </xsl:template>

  <xsl:template mode="cmd-desc" match="td">
	<xsl:value-of select="normalize-space()"/> 
  </xsl:template>

  <xsl:template match="text()"/>

</xsl:stylesheet>
