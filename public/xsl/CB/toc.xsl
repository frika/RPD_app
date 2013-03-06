<?xml version="1.0" encoding="UTF-8"?>
<!-- Edited by XMLSpy® -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" version="1.0"
	encoding="utf-8"/>

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
				  
	    <div id='container'>
				<header class="home-header">
				        <h1><a href="/">Canadian Business</a></h1>
				        <div class="date">March 4, 2013</div>
				      </header>
				      <div id='main' class="home" role='main'>

				      	<div class="image-featured">
<div id="wrapper"></div>
<div class="featured-nav">
<span>•</span><span>•</span><span>•</span>
</div>
</div>
				        <section class="category thisweek">
				          <h1>This week</h1>
									<!-- This Week Loop -->
									<xsl:for-each select="catalog/body[position() &lt; 8]">
									
									    <xsl:choose>
											  <xsl:when test="position()=1">
											    <article><h2><a href="#">From the editors</a></h2></article>
											  </xsl:when>
											  <xsl:when test="position()=2">
											    <article><h2><a href="#">Letters</a></h2></article>
											  </xsl:when>
												<xsl:when test="body.head/hedline='Good News'">
											    <article><h2><a href="#">Good news/Bad news</a></h2></article>
											  </xsl:when>
												<xsl:when test="sections='Opinion'">
											    <article><h2><a href="#">Opinion: <strong><xsl:value-of select="body.head/hedline"/></strong></a></h2></article>
											  </xsl:when>
												<xsl:when test="sections='Interview'">
											    <article><h2><a href="#">Interview: <strong><xsl:value-of select="body.head/hedline"/></strong></a></h2></article>

											  </xsl:when>
											  <xsl:when test="sections='National'">
											    
											  </xsl:when>
											  <xsl:otherwise>
											    <article><h2><a href="#"><xsl:value-of select="body.head/hedline"/></a></h2></article>
											  </xsl:otherwise>
											</xsl:choose>
				          
									</xsl:for-each>
									<!-- end This Week Loop -->
				        </section>
				
								<section class="category special">
				          			<h1>Special issue</h1>
												<xsl:for-each select="catalog/body">
													<xsl:choose>
													  <xsl:when test="sections='Newsmakers 2012'">
														  <article><h2><a href="#">
													    <xsl:value-of select="body.head/hedline"/>  
													    <strong>
																<xsl:value-of select="concat(' ', body.head/abstract)"/>
															</strong>
															</a></h2></article>
													  </xsl:when>
													  <xsl:when test="sections='Royal Baby'">
														  <article><h2><a href="#">
													    <xsl:value-of select="body.head/hedline"/>  
													    <strong>
																<xsl:value-of select="concat(' ', body.head/abstract)"/>
															</strong>
															</a></h2></article>
													  </xsl:when>
													</xsl:choose>
												</xsl:for-each>	
				        </section>
				
				        <section class="category national">
				          <h1>National</h1>
				          
				            
												<xsl:for-each select="catalog/body">
													<xsl:choose>
													  <xsl:when test="sections='National'">
														  <article><h2><a href="#">
													    <xsl:value-of select="body.head/hedline"/>
													    <strong>
																<xsl:value-of select="concat(' ', body.head/abstract)"/>
															</strong>
															</a></h2></article>
													  </xsl:when>

														<xsl:when test="sections='Justice'">
														  <article><h2><a href="#">
													    <xsl:value-of select="body.head/hedline"/>
													    <strong>
																<xsl:value-of select="concat(' ', body.head/abstract)"/>
															</strong>
															</a></h2></article>
													  </xsl:when>
														<xsl:when test="sections='The Power List'">
														  <article><h2><a href="#">
													    <xsl:value-of select="body.head/hedline"/>
													    <strong>
																<xsl:value-of select="concat(' ', body.head/abstract)"/>
															</strong>
															</a></h2></article>
													  </xsl:when>

													</xsl:choose>
												</xsl:for-each>	
										

				        </section>
				        <section class="category international">
				          <h1>International</h1>
				          <xsl:for-each select="catalog/body">
										<xsl:choose>
										  <xsl:when test="sections='International'">
											  <article><h2><a href="#">
										    <xsl:value-of select="body.head/hedline"/>
										    <strong>
													<xsl:value-of select="concat(' ', body.head/abstract)"/>
												</strong>
												</a></h2></article>
										  </xsl:when>
										</xsl:choose>
									</xsl:for-each>
				        </section>
								<section class="category business">
				          <h1>Business</h1>
				          <xsl:for-each select="catalog/body">
										<xsl:choose>
										  <xsl:when test="sections='Business'">
											  <article><h2><a href="#">
										    <xsl:value-of select="body.head/hedline"/>
										    <strong>
													<xsl:value-of select="concat(' ', body.head/abstract)"/>
												</strong>
												</a></h2></article>
										  </xsl:when>
										</xsl:choose>
									</xsl:for-each>
				        </section>
				        <section class="category society">
				          <h1>Society</h1>
				          <xsl:for-each select="catalog/body">
										<xsl:choose>
										  <xsl:when test="sections='Society' or sections='Health'">
											  <article><h2><a href="#">
										    <xsl:value-of select="body.head/hedline"/>
										    <strong>
													<xsl:value-of select="concat(' ', body.head/abstract)"/>
												</strong>
												</a></h2></article>
										  </xsl:when>
										</xsl:choose>
									</xsl:for-each>
				        </section>
								<section class="category bak">
				          <h1>Back pages</h1>
				          <xsl:for-each select="catalog/body">
										<xsl:choose>
										  <xsl:when test="sections='Film'">

											  <article><h2><a href="#"><b class="film">Film</b><br />
											  <strong><xsl:value-of select="body.head/hedline"/></strong>
												</a></h2></article>
										  </xsl:when>
											<xsl:when test="sections='Taste'">
											  <article><h2><a href="#"><b class="taste">Taste</b><br />
											  <strong><xsl:value-of select="body.head/hedline"/></strong>
												</a></h2></article>
										  </xsl:when>
											<xsl:when test="sections='Bazaar'">
											  <article><h2><a href="#"><b class="bazaar">Bazaar</b> <br />
											  <strong><xsl:value-of select="body.head/hedline"/></strong>
												</a></h2></article>
										  </xsl:when>
											<xsl:when test="sections='humor'">
											  <article><h2><a href="#"><b class="humor">Humour</b><br /> 
											  <strong><xsl:value-of select="body.head/hedline"/></strong>
												</a></h2></article>
										  </xsl:when>
											<xsl:when test="sections='Media'">
											  <article><h2><a href="#"><b class="media">Media</b><br /> 
											  <strong><xsl:value-of select="body.head/hedline"/></strong>
												</a></h2></article>
										  </xsl:when>
											<xsl:when test="sections='Stage'">
											  <article><h2><a href="#"><b class="stage">Stage</b><br /> 
											  <strong><xsl:value-of select="body.head/hedline"/></strong>
												</a></h2></article>
										  </xsl:when>
											<xsl:when test="sections='Radio'">
											  <article><h2><a href="#"><b class="radio">Radio</b><br /> 
											  <strong><xsl:value-of select="body.head/hedline"/></strong>
												</a></h2></article>
										  </xsl:when>
											<xsl:when test="sections='TV'">
											  <article><h2><a href="#"><b class="tv">TV</b><br /> 
											  <strong><xsl:value-of select="body.head/hedline"/></strong>
												</a></h2></article>
										  </xsl:when>
											<xsl:when test="sections='Exhibit'">
											  <article><h2><a href="#"><b class="exhibit">Exhibit</b><br /> 
											  <strong><xsl:value-of select="body.head/hedline"/></strong>
												</a></h2></article>
										  </xsl:when>
											<xsl:when test="sections='Art'">
											  <article><h2><a href="#"><b class="arts">Art</b><br /> 
											  <strong><xsl:value-of select="body.head/hedline"/></strong>
												</a></h2></article>
										  </xsl:when>
											<xsl:when test="sections='Books'">
											  <article><h2><a href="#"><b class="books">Books</b><br /> 
											  <strong><xsl:value-of select="body.head/hedline"/></strong>
												</a></h2></article>
										  </xsl:when>
											<xsl:when test="sections='Help'">
											  <article><h2><a href="#"><b class="help">Help</b><br /> 
											  <strong><xsl:value-of select="body.head/hedline"/></strong>
												</a></h2></article>
										  </xsl:when>
										  <xsl:when test="sections='Architecture'">
											  <article><h2><a href="#"><b class="architecture">Architecture</b><br /> 
											  <strong><xsl:value-of select="body.head/hedline"/></strong>
												</a></h2></article>
										  </xsl:when>
											<xsl:when test="sections='Web'">
											  <article><h2><a href="#"><b class="web">Web</b><br /> 
											  <strong><xsl:value-of select="body.head/hedline"/></strong>
												</a></h2></article>
										  </xsl:when>
											<xsl:when test="sections='Music'">
											  <article><h2><a href="#"><b class="music">Music</b><br /> 
											  <strong><xsl:value-of select="body.head/hedline"/></strong>
												</a></h2></article>
										  </xsl:when>
											<xsl:when test="sections='Feschuk'">
											  <article><h2><a href="#"><b class="feschuk">Feschuk</b><br /> 
											  <strong><xsl:value-of select="body.head/hedline"/></strong>

												</a></h2></article>
										  </xsl:when>
										</xsl:choose>
									</xsl:for-each>
				        </section>
								<section class="category theend">
				          <h1>The end</h1>
				          <xsl:for-each select="catalog/body">
										<xsl:choose>
										  <xsl:when test="sections='The end'">
											  <article><h2><a href="#">
										    <xsl:value-of select="body.head/hedline"/>
												</a></h2></article>
										  </xsl:when>
										  <xsl:when test="sections='The End'">
											  <article><h2><a href="#">
										    <xsl:value-of select="body.head/hedline"/>
												</a></h2></article>
										  </xsl:when>
										</xsl:choose>
									</xsl:for-each>
				        </section>
	  		      
	      <footer></footer>
	    </div>

			<script src="../WEB_ASSETS/js/jquery-1.6.2.min.js"></script>
			<script src='../WEB_ASSETS/js/jquery.fancybox.js'></script>
			<script src="../WEB_ASSETS/js/script.js"></script>
			<script src="../WEB_ASSETS/js/swipeview.js"></script>

			<script>
			INSERT SCRIPT HERE WITH FEATURED IMAGE URLS
			</script>

			</div></body>
			</html>

</xsl:template>
</xsl:stylesheet>

