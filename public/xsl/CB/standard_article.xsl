<?xml version="1.0" encoding="UTF-8"?>
<!-- Edited by XMLSpy® -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
	<html>
	  <head>
	    <meta charset="utf-8" />
	    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
	    <meta content="width=device-width, initial-scale=1, maximum-scale=1" name="viewport" />
	    <title>Canadian Business</title><link href="../WEB_ASSETS/stylesheets/all.css" media="screen" rel="stylesheet" type="text/css" /><script src="../WEB_ASSETS/javascripts/all.js" type="text/javascript"></script></head>
	  <body>
	  	<xsl:for-each select="nitf/body"> 
		    <div class="container">
		      <div id="main">
		        <article class="article">
		        	<div class="image-featured">
		        		<xsl:if test="photo">
		            	<a class="fancybox">
										<xsl:attribute name="href">	        
		            			<xsl:value-of select="concat('../WEB_ASSETS/', substring-after(photo/@href, 'file://'))" />
		          			</xsl:attribute>
										<xsl:attribute name="title">
		            			<xsl:value-of select="concat(photo.caption, '&lt;br/&gt;&lt;small&gt;', photo.byline, '&lt;/small&gt;')" />
		          			</xsl:attribute>
		            		<img style="max-height:250px;">
		            			<xsl:attribute name="src">	        
		              			<xsl:value-of select="concat('../WEB_ASSETS/', substring-after(photo/@href, 'file://'))" />

		            			</xsl:attribute>
										</>
										<div class="caption-opener">&nbsp;</div>
		            	</a>
								</xsl:if>
		        	</div>
		          <div class="slug"><xsl:copy-of select="//slug"/></div>
		          <div class="hedline">
		            <h1><xsl:value-of select="//hedline"/></h1>
		          </div>
		          <div class="abstract"><xsl:value-of select="body.head/abstract"/></div>
		          <div class="byline">
		          	<xsl:choose>
								  <xsl:when test="body.head/byline">
										By
								    <xsl:value-of select="body.head/byline"/>
								  </xsl:when>
								  <xsl:when test="body.content/byline">
										By
								    <xsl:value-of select="body.content/byline[position() = 1]"/>
								  </xsl:when>
								</xsl:choose>
		          </div>
		          <div class="content">
		          	<xsl:for-each select="body.content/*">
					        <xsl:choose>
										<xsl:when test="local-name()='hedline'">
											<div class="hedline"><h1><xsl:value-of select="."/></h1></div>
											<div class="byline">By <xsl:value-of select="following-sibling::byline"/></div>
										</xsl:when>
										<xsl:when test="local-name()='slug'">
											<hr/>
											<div class="slug"><xsl:value-of select="."/></div>
										</xsl:when>
										<xsl:when test="local-name()='byline'">		
										</xsl:when>
										<xsl:when test="local-name()='em'">
											<em><xsl:value-of select="."/></em>
										</xsl:when>
										<xsl:when test="local-name()='p'">
											<p><xsl:value-of select="."/></p>
										</xsl:when>
									</xsl:choose>
							  </xsl:for-each>
		          </div></article>
		      </div>
		    </div>
		  </xsl:for-each>
	  </body>
	</html>
</xsl:template>
</xsl:stylesheet>

