<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
    <head>
      <script src="jquery-1.9.0.min.js">
      </script>
      <script type="text/javascript">
        function toggleElement(element)
        {
          $(element).next().slideToggle();
        }
        function expandAll()
        {
          $("body").children("div").slideDown();
        }
        function collapseAll()
        {
          $("body").children("div").slideUp();
        }
      </script>
    </head>
    <body>
      <h1>Entity Search Result</h1>
      <button type="button" onclick="expandAll()">Expand All !</button>
      <button type="button" onclick="collapseAll()">Collapse All !</button>
      <xsl:for-each select="entitiesSearch-results/entity">
        <p onclick="toggleElement(this)">
          <b><xsl:value-of select="position()"/> - <xsl:value-of select="@entity-name"/></b>
        </p>
        <div>
          <xsl:apply-templates select="discogs-search"/>
          <xsl:apply-templates select="yahoo-Search"/>
        </div>
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
    <xsl:for-each select="*">
      <xsl:choose>
        <xsl:when test="name(.) = 'str'"> <!-- 'str' node -->
          <tr>
            <th><xsl:value-of select="@name"/></th>
            <td><xsl:value-of select="."/></td>
          </tr>
        </xsl:when>
        <xsl:otherwise> <!-- 'arr' node -->
          <xsl:apply-templates select="."/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
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

  <xsl:for-each select="result">
    <table>
      <xsl:for-each select="*">
        <tr>
          <xsl:choose>
            <xsl:when test="name(.) = 'url'"> <!-- 'url' node -->
              <th> Url </th>
              <td> <xsl:value-of select="."/> </td>
            </xsl:when>
            <xsl:when test="name(.) = 'title'"> <!-- 'title' node -->
              <th> Title </th>
              <td> <xsl:value-of select="."/> </td>
            </xsl:when>
            <xsl:when test="name(.) = 'abstract'"> <!-- 'abstract' node -->
              <th> Abstract </th>
              <td> <xsl:value-of select="."/> </td>
            </xsl:when>
          </xsl:choose>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>