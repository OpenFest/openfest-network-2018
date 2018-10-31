<?xml version="1.0"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
        <xsl:output method="text" />
        <xsl:template match="/">
                <xsl:value-of select="count(/rtmp/server/application/live/stream)"/>
        </xsl:template>
</xsl:transform>