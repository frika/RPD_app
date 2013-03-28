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
		        <article class="article letters">
		          <blockquote>ENTER BLOCKQUOTE HERE</blockquote>
		          <div class="content">
		          	<img src="../WEB_ASSETS/images/previous_cover.jpg" style="width:108px;float:left;margin:0 10px 5px 0;box-shadow:2px 2px 2px #999" />
		          	<xsl:for-each select="body.content/*">
										<p><xsl:value-of select="."/></p>
							  </xsl:for-each>
		          </div></article>
		      </div>
		    </div>
		  </xsl:for-each>
	  </body>
	</html>
</xsl:template>
</xsl:stylesheet>

