<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="xsl tei xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="partials/html_footer.xsl"/>
    <xsl:import href="partials/osd-container.xsl"/>
    <xsl:import href="partials/tei-facsimile.xsl"/>
    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select=".//tei:title[@type='label'][1]/text()"/>
        </xsl:variable>
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <xsl:call-template name="html_head">
                <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
            </xsl:call-template>
            
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>
                    
                    <div class="container-fluid">                        
                        <div class="card">
                            <div class="card-header">
                                <h1><xsl:value-of select="$doc_title"/></h1>
                            </div>
                            <div class="card-body"> 
                                <div class="card-header">
                                    <h3>Regest</h3>
                                </div>
                                <div class="card-body" style="font-style:italic">
                                    <xsl:apply-templates select="//tei:msContents"/>
                                </div>
                                <div class="card-header">
                                    <h3>Anmerkungen zum Dokument</h3>
                                </div>
                                <div class="card-body">
                                    <xsl:apply-templates select="//tei:physDesc"/>
                                    <xsl:apply-templates select="//tei:publicationStmt"/>
                                </div>
                                <div class="card-header">
                                    <h3>Schlagworte</h3>
                                </div>
                                <div class="card-body">
                                    <h4>
                                        <xsl:for-each select=".//tei:term">
                                            
                                            <a>
                                                <span class="badge badge-info" style="background-color: #0063a6; margin-left: 1em;">
                                                    <xsl:value-of select="."/>
                                                </span>
                                            </a>
                                            
                                        </xsl:for-each>
                                    </h4>
                                </div>
                                
                                <div class="card-header">
                                    <h3>Edierter Text</h3>
                                </div>
                                <div class="card-body">
                                    <xsl:apply-templates select="//tei:div[@type='transcript']"/>
                                </div>
                                <div class="card-footer">
                                    <p style="text-align:center;">
                                        <xsl:for-each select=".//tei:note[not(./tei:p)]">
                                            <div class="footnotes">
                                                <xsl:element name="a">
                                                    <xsl:attribute name="name">
                                                        <xsl:text>fn</xsl:text>
                                                        <xsl:number level="any" format="1" count="tei:note"/>
                                                    </xsl:attribute>
                                                    <a>
                                                        <xsl:attribute name="href">
                                                            <xsl:text>#fna_</xsl:text>
                                                            <xsl:number level="any" format="1" count="tei:note"/>
                                                        </xsl:attribute>
                                                        <span style="font-size:7pt;vertical-align:super; margin-right: 0.4em">
                                                            <xsl:number level="any" format="1" count="tei:note"/>
                                                        </span>
                                                    </a>
                                                </xsl:element>
                                                <xsl:apply-templates/>
                                            </div>
                                        </xsl:for-each>
                                    </p>
                                </div>
                            </div>
                        </div>                       
                    </div>
                    <xsl:call-template name="html_footer"/>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="tei:p">
        <p id="{generate-id()}"><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="tei:div">
        <div id="{generate-id()}"><xsl:apply-templates/></div>
    </xsl:template>
    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>
    <xsl:template match="tei:unclear">
        <abbr title="unclear"><xsl:apply-templates/></abbr>
    </xsl:template>
    <xsl:template match="tei:del">
        <del><xsl:apply-templates/></del>
    </xsl:template>
    <xsl:template match="tei:term"/>
    <xsl:template match="tei:note">
        <xsl:element name="a">
            <xsl:attribute name="name">
                <xsl:text>fna_</xsl:text>
                <xsl:number level="any" format="1" count="tei:note"/>
            </xsl:attribute>
            <xsl:attribute name="href">
                <xsl:text>#fn</xsl:text>
                <xsl:number level="any" format="1" count="tei:note"/>
            </xsl:attribute>
            <xsl:attribute name="title">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:attribute>
            <sup>
                <xsl:number level="any" format="1" count="tei:note"/>
            </sup>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:table">
        <xsl:element name="table">
            <xsl:attribute name="class">
                <xsl:text>table table-bordered table-striped table-condensed table-hover</xsl:text>
            </xsl:attribute>
            <xsl:element name="tbody">
                <xsl:apply-templates/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template match="tei:row">
        <xsl:element name="tr">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="tei:cell">
        <xsl:element name="td">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>