<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">     
<xsl:output method="html"/> 
<xsl:template match="/"> 
    <html>
        <head>
        <title>XML and XSL</title>
        </head>
        <body> 
            <h1>Student Details</h1> 
            <table border="1"> 
                <tr> 
                    <th>Name</th> 
                    <th>Department</th> 
                    <th>CGPA</th> 
                </tr> 
                <xsl:for-each select="college/student"> 
                    <xsl:choose> 
                        <xsl:when test="Dept = 'CSE'"> 
                        <tr bgcolor="pink"> 
                            <td> 
                                <xsl:value-of select="Name"/> 
                            </td> 
                            <td> 
                                <xsl:value-of select="Dept"/> 
                            </td>   
                            <td> 
                                <xsl:value-of select="Cgpa"/> 
                            </td>  
                        </tr> 
                        </xsl:when> 
                        <xsl:otherwise> 
                        <tr> 
                            <td> 
                                <xsl:value-of select="Name"/> 
                            </td> 
                            <td> 
                                <xsl:value-of select="Dept"/> 
                            </td>  
                            <td> 
                                <xsl:value-of select="cgpa"/> 
                            </td>      
                        </tr> 
                        </xsl:otherwise> 
                    </xsl:choose> 
                </xsl:for-each> 
            </table> 
        </body> 
    </html> 
</xsl:template> 
</xsl:stylesheet>