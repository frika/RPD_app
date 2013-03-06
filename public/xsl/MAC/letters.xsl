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
	        <article>




	          <div class="hedline"><h1><xsl:copy-of select="sections"/></h1></div>
	          <blockquote>
						            INSERT BLOCKQUOTE HERE
						            <small>WRITER, LOCATION</small>
						</blockquote>
	          <div class="content letters">
	           <xsl:for-each select="body.content/p">
							 <p><xsl:value-of select="."/></p>
						 </xsl:for-each>
						 <xsl:choose>
					<xsl:when test="sections='Letters'">  
						<div class="weblinks">
      						<hr/>
      						We welcome readers to submit letters to 
      						<a class="url" href="mailto:letters@macleans.ca">letters@macleans.ca</a>
    					</div>
					</xsl:when>
				</xsl:choose>
	          </div>
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

