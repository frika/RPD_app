<?xml version="1.0" encoding="UTF-8"?>
<!-- Edited by XMLSpy® -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="1.0" encoding="utf-8"/>
<xsl:template match="/">
  <html>
    <head>
      <meta charset="utf-8" />
      <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
      <meta content="width=device-width, initial-scale=1, maximum-scale=1" name="viewport" />
      <title>Canadian Business</title><link href="../WEB_ASSETS/stylesheets/all.css" media="screen" rel="stylesheet" type="text/css" /><script src="../WEB_ASSETS/javascripts/all.js" type="text/javascript"></script></head>
    <body>
      <div class="container">
        <div id="toc"><header class="toc">
            <h1>March 18, 2013</h1>
          </header>
          <section class="category">
            <h1>Cover</h1>
          </section>
          <section class="category">
            <h1>Features</h1>
              <xsl:for-each select="catalog/article">
                <xsl:choose>
                  <xsl:when test="pubdata/@position.section='Features' or pubdata/@position.section='Special Report'">
                    <article class="feature">
                      <a href="#?ID=">
                      	<img style="width:296px;height:auto;">
				            			<xsl:attribute name="src">	        
				              			<xsl:value-of select="concat('../WEB_ASSETS/', substring-after(body/photo/@href, 'file://'))" />
				            			</xsl:attribute>
												</>
                        <h2><xsl:value-of select="body/body.head/hedline"/></h2>
                        <p><xsl:value-of select="concat(' ', body/body.head/abstract)"/></p>
                      </a>
                    </article>
                  </xsl:when>
                </xsl:choose>
              </xsl:for-each>
          </section>
          <section class="category">
            <h1>Departments</h1>
            <article class="main">
              <a href="#?ID="><h2>Editor's Letter</h2> <p></p></a>
            </article>
            <article class="main">
              <a href="#?ID="><h2>Letters</h2> <p></p></a>
            </article>
            <article class="main">
              <a href="#?ID="><h2>Briefing</h2> <p></p></a>
            </article>
            <xsl:for-each select="catalog/article/body">
              <xsl:if test="(sections='Ontario') or (sections='Alberta') or (sections='British Columbia') or (sections='Manitoba') or (sections='Saskatchewan') or (sections='Quebec') or (sections='New Brunswick') or (sections='Prince Edward Island') or (sections='Newfoundland') or (sections='Nova Scotia') or (sections='Yukon') or (sections='Northwest Territories') or (sections='Nunavut')">
                <article class="main">
                  <a href="#?ID="><h2><xsl:value-of select="sections"/></h2> <p></p></a>
                </article>
              </xsl:if>
            </xsl:for-each>
            <article class="main">
              <a href="#?ID="><h2>Big Picture</h2> <p></p></a>
            </article>
            <article class="main">
              <a href="#?ID="><h2>Comment</h2> <p></p></a>
            </article>
            <article class="main">
              <a href="#?ID="><h2>Winners &amp; Losers</h2> <p></p></a>
            </article>
            <article class="main">
              <a href="#?ID="><h2>Investing</h2> <p></p></a>
            </article>
            <article class="main">
              <a href="#?ID="><h2>CB Informer</h2> <p></p></a>
            </article>
            <article class="main">
              <a href="#?ID="><h2>Trailing Indicator</h2> <p></p></a>
            </article>
          </section></div>
      </div>
    </body>
  </html>
</xsl:template>
</xsl:stylesheet>