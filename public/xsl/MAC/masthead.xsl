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
				<header class="home-header">
				        <h1><a href="/">Maclean's</a></h1>
				      </header>
				      <div id='main' class="home masthead" role='main'>
				        <xsl:for-each select="body.content/p">
									 <xsl:copy-of select="."/>
								 </xsl:for-each>
				      </div>
	  		      
	      <footer></footer>
	    </div>
			<script src="../WEB_ASSETS/js/jquery-1.6.2.min.js"></script>
			<script src='../WEB_ASSETS/js/jquery.fancybox.js'></script>
			<script src="../WEB_ASSETS/js/script.js"></script>
			<script src="../WEB_ASSETS/js/swipeview.js"></script>

			</div>
			</xsl:for-each>
			</body>
			</html>

</xsl:template>
</xsl:stylesheet>

