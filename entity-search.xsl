<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
    <body>
      <h1>Entity Search Result</h1>
      <xsl:for-each select="entitiesSearch-results/entity">

        <p>
          <b>- <xsl:value-of select="@entity-name"/></b>
        </p>

        <xsl:apply-templates select="discogs-search"/>
        <xsl:apply-templates select="yahoo-Search"/>

      </xsl:for-each>
    </body>
  </html>
</xsl:template>

<xsl:template match="discogs-search">
  <p>
    Results from: discogs ( uninformative-matches: 
    <xsl:value-of select="@uninformative-matches"/>
    / informative-matches: 
    <xsl:value-of select="@informative-matches"/>
    )            
  </p>

  <xsl:apply-templates select="doc"/>

</xsl:template>

<xsl:template match="doc">
  <table>
    <xsl:for-each select="str">
      <tr>
        <th><xsl:value-of select="@name"/></th>
        <td><xsl:value-of select="."/></td>
      </tr>
    </xsl:for-each>
    <xsl:apply-templates select="arr"/>
  </table>
</xsl:template>

<xsl:template match="arr">
  <tr>
    <th><xsl:value-of select="@name"/></th>
    <td>
      <xsl:for-each select="str">
      <p>
        <xsl:value-of select="."/>
      </p>
      </xsl:for-each>
    </td>
  </tr>
</xsl:template>

<xsl:template match="yahoo-Search">
  <p>
    Results from: yahoo (total-matches: 
    <xsl:value-of select="@total-matches"/>
    )
  </p>
</xsl:template>

 

</xsl:stylesheet>