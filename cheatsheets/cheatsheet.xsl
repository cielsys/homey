<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
  <xsl:output method="xml" indent="yes" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"/>

  <xsl:template match="/">
	<html>
	  <head>
		<title>Emacs Cheat Sheet ver1.0 &#x24B8; 2018 CLeith</title>
		<link href="cheatsheet-screen.css" title="Default" rel="stylesheet" type="text/css" />
		<link href="cheatsheet-print.css" rel="stylesheet" type="text/css" media="print"/>
	  </head>
	  <body>       
		<h2 class="no-print" >Emacs Cheat Sheet ver1.0<small> &#x24B8; 2018 CLeith All Rights Reserved</small></h2>
		<xsl:apply-templates select="ecs/layouts/layout[@paper-size='8x14in' and @orientation='landscape']" />
        <footer>ver1.0 &#x24B8; Copyright 2018 CLeith All Rights Reserved</footer>
	  </body>
	</html>
  </xsl:template>

  <!-- ====================================== layout ===================  -->
  <xsl:template match="layout">
	<xsl:apply-templates select="page" />
  </xsl:template>

  <!-- ====================================== page ===================  -->
  <xsl:template match="page">
	<span class="no-print">Page <xsl:value-of select="position()"/></span>
	<div class="print-page-content" page-num="{position()}">	  
	  <xsl:apply-templates select="col" />
	</div>
	<div class="print-page-margin" page-num="{position()}" />
	<br class="pbreak" />
  </xsl:template>

  <!-- ====================================== col ===================  -->
  <xsl:template match="col">
	<div page-col="{position()}">
	  <xsl:for-each select="cmd-family" >
		<xsl:variable name="cur-cmd-family-name" select="@cmd-family-name" />
		<xsl:variable name="cur-pkg" select="@pkg" />

		<xsl:apply-templates select="/ecs/cmd-family[@cmd-family-name=$cur-cmd-family-name and @pkg=$cur-pkg]" />
	  </xsl:for-each>
	</div>
  </xsl:template>
	  
<!-- ====================================== cmd-family ===================  -->
  <xsl:template match="cmd-family">
	  <div class="cmd-family">
		<cmd-family-name><xsl:value-of select="@cmd-family-name"/></cmd-family-name>
		<xsl:apply-templates select="cmd-table"/>
	  </div>
  </xsl:template>

  <!-- ====================================== cmd-table ===================  -->
  <!--  border="1" -->
  <xsl:template match="cmd-table">
	<table cellspacing="0">
	  <xsl:apply-templates select="@caption" />
	  <tbody>
		<tr>
		  <xsl:apply-templates select="col-header"/>
		</tr>
		<xsl:apply-templates select="cmd-list/cmd"/>
	  </tbody>
	</table>
  </xsl:template>

  <xsl:template match="col-header">
	<th><xsl:value-of select="."/></th>
  </xsl:template>

  <xsl:template match="@caption">
	<caption><xsl:value-of select="."/></caption>
  </xsl:template>

  <!-- ====================================== cmd ===================  -->
  <xsl:template match="cmd">
	<tr class="b{(position()+1) mod 2}" >
	  <td>
		<xsl:copy-of select="cmd-desc/node()"/>
	  </td>
	  <xsl:apply-templates select="key-sequence"/>
	</tr>
  </xsl:template>
  <xsl:template match="key-sequence">
	<td class="key-seq">
	  <xsl:value-of select="."/>
	</td>
  </xsl:template>

    <!-- ====================================== generate-columns ===================  -->
  <xsl:template name="generate-columns">
	<xsl:param name="page-num" />
	<xsl:call-template name="generate-columns">
	  <xsl:with-param name="page-num" select="0" />
	</xsl:call-template>
	
	<div>
	  <xsl:call-template name="generate-column">
		<xsl:with-param name="page-num" select="$page-num" />
		<xsl:with-param name="page-col" select="0" />
	  </xsl:call-template>
	</div>
  </xsl:template>
  
  <!-- ====================================== generate-column ===================  -->
  <xsl:template name="generate-column">
	<xsl:param name="page-num" />
	<xsl:param name="page-col" />
	<div page-col="{$page-col}">
	  <xsl:apply-templates select="//ecs/cmd-family/print-layout[@page-num=$page-num and @page-col=$page-col]/.." />
	</div>

  </xsl:template>

</xsl:stylesheet>

<!--
	<xsl:for-each select="ecs/cmd-family/print-layout[@page-num=0]/..">
	<xsl:sort select="print-layout/@page-col" />
	<xsl:apply-templates select="//print-layout[@page-num=0 and @page-col=$cur-col]/.."/>
	</xsl:for-each>
-->
