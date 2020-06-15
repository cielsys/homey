<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
  <xsl:output method="xml" indent="yes" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"/>
 
  <xsl:template match="tables-container">
	<html>
	  <head>
		<title>emacs cheat sheet</title>
		<link href="tables.css" title="Default" rel="stylesheet" type="text/css" />
	  </head>
	  <body>
		<h2>Emacs Cheat Sheet</h2>
		<xsl:apply-templates select="list" />
	  </body>
	</html>
  </xsl:template>

  <!-- ====================================== list ===================  -->
  <xsl:template match="list">
	<table> 
	  <caption>
		<xsl:value-of select="record-def/name"/>
	  </caption>
	  <tbody>
		<xsl:apply-templates />
	  </tbody>
	</table>
  </xsl:template>

  <!-- ====================================== item ===================  -->
  <xsl:template match="item">
	<tr>
	  <td ><xsl:value-of select="record-def/name"/></td>
	  <xsl:apply-templates select="record-def/field"/>
	</tr>
  </xsl:template>
  <xsl:template match="record-def/field">
	  <td class="key-seq"><xsl:value-of select="."/></td>
  </xsl:template>

  <!-- ====================================== record-def/name ===================  -->
  <!-- Supress default output of text node -->
  <xsl:template match="record-def/name">
  </xsl:template >

</xsl:stylesheet> 
