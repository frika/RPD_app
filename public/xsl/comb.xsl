<?xml version="1.0" encoding="UTF-8"?>
<!-- Edited by XMLSpy® -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
	<?xml version="1.0" encoding="ISO-8859-1"?>
	<!-- Edited by XMLSpy® -->
	
			<xsl:for-each select="nitf"> 
				  
	    	<xsl:copy-of select="body"/>
			
		  </xsl:for-each>
		
	
</xsl:template>
</xsl:stylesheet>

