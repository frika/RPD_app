<?xml version="1.0" encoding="UTF-8"?>
<!-- Edited by XMLSpy® -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
	<!--[if lt IE 7]> <html lang="en" class="no-js ie6 oldie"> <![endif]-->
	<!--[if IE 7]>    <html lang="en" class="no-js ie7 oldie"> <![endif]-->
	<!--[if IE 8]>    <html lang="en" class="no-js ie8 oldie"> <![endif]-->
	<!--[if gt IE 8]><!-->
	<html class='no-js' lang='en'>
		<head>
	    <meta charset='utf-8' />
	    <meta content='IE=edge,chrome=1' http-equiv='X-UA-Compatible' />
	    <title></title>
	    <meta content='width=device-width, initial-scale=1.0' name='viewport' />

	    <link href='../WEB_ASSETS/css/style.css' rel='stylesheet' />

	  </head>
  	<body>
			<xsl:for-each select="nitf/body"> 	  
	    <div id='container'>
	      <div id='main' role='main'>
	        <article class="goodnews">
						<div class="hedline"><h1>Good news</h1></div>
							    <div class="image-featured">
										<xsl:if test="photo">
				            	<a class="fancybox">
												<xsl:attribute name="href">	        

			              			<xsl:value-of select="concat('../WEB_ASSETS/', substring-after(photo/@href, 'file://'))" />
			            			</xsl:attribute>
												<xsl:attribute name="title">	        
			              			<xsl:value-of select="concat(photo.caption, '&lt;br/&gt;&lt;small&gt;', photo.byline, '&lt;/small&gt;')" />
			            			</xsl:attribute>

				            			<img>
				            				<xsl:attribute name="src">	        

				              				<xsl:value-of select="concat('../WEB_ASSETS/', substring-after(photo/@href, 'file://'))" />

				            				</xsl:attribute>
													</>
<div class="caption-opener">&nbsp;</div>
				            	</a>
										</xsl:if>

				          </div>



	          
	           <dl class="accordion">	
	           <xsl:for-each select="body.content/p[position() &lt; 9]">
							<xsl:choose>
							<xsl:when test="position() mod 2 ">
								<dt><a href=""><xsl:value-of select="."/></a></dt>
							</xsl:when>
							<xsl:otherwise>
								<dd><xsl:value-of select="."/></dd>
							</xsl:choose>
						 </xsl:for-each>
          	</dl>
						<div class="hedline" style="margin-top:25px;"><h1>Bad news</h1></div>

<div class="image-featured">
										<xsl:if test="photo | photo[position()=2]">
				            	<a class="fancybox">
												<xsl:attribute name="href">	        

			              			<xsl:value-of select="concat('../WEB_ASSETS/', substring-after(photo[position()=2]/@href, 'file://'))" />
			            			</xsl:attribute>
												<xsl:attribute name="title">	        
			              			<xsl:value-of select="concat(photo.caption[position()=2], '&lt;br/&gt;&lt;small&gt;', photo.byline, '&lt;/small&gt;')" />
			            			</xsl:attribute>

				            			<img>
				            				<xsl:attribute name="src">	        

				              				<xsl:value-of select="concat('../WEB_ASSETS/', substring-after(photo[position()=2]/@href, 'file://'))" />

				            				</xsl:attribute>
													</>
<div class="caption-opener">&nbsp;</div>
				            	</a>
										</xsl:if>

				          </div>


						<dl class="accordion">
						<xsl:for-each select="body.content/p[position() &gt; 7]">
							<xsl:choose>
							<xsl:when test="position() mod 2 = 0">
								<dt><a href=""><xsl:value-of select="."/></a></dt>
							</xsl:when>
							<xsl:otherwise>
								<dd><xsl:value-of select="."/></dd>
							</xsl:choose>
						 </xsl:for-each>
						</dl>
	      </article>
	      </div>
	      <footer></footer>
	    </div>

	        <script src="../WEB_ASSETS/js/jquery-1.6.2.min.js"></script>
	    <script src='../WEB_ASSETS/js/jquery.fancybox.js'></script>
	    <script src='../WEB_ASSETS/js/plugins.js'></script>
	    <script src='../WEB_ASSETS/js/script.js'></script>

	    <!--[if lt IE 7]>
	    <script src='//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js'></script>
	    <script>
	      window.attachEvent('onload',function(){CFInstall.check({mode:'overlay'})});
	    </script>
	    <![endif]-->
	    </xsl:for-each>
	  </body>
	</html>
</xsl:template>
</xsl:stylesheet>

