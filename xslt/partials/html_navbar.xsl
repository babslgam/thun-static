<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xsl tei xs" version="2.0">
    <xsl:template match="/" name="nav_bar">
        <header>
            <nav class="navbar navbar-expand-md navbar-light  bg-white box-shadow">
                <a class="navbar-brand" href="index.html">
                    thun
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"/>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Info
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="show.html?document=about.xml&amp;directory=meta&amp;stylesheet=meta">Über die Webseite</a>
                                <a class="dropdown-item" href="show.html?document=how-to-use.xml&amp;directory=meta&amp;stylesheet=meta">Benützungshinweise</a>
                                <div class="dropdown-divider"/>
                                <a class="dropdown-item" href="../api/api.html">API</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Bestände
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="toc.html?bestand=nachlass">Nachlass Leo Thun</a>
                                <a class="dropdown-item" href="toc.html?bestand=autographen">Autographen Leo Thun / Briefe aus anderen Archiven</a>
                                <a class="dropdown-item" href="toc.html?bestand=gesamt">Gesamter Bestand</a>
                                <div class="dropdown-divider"/>
                                <a class="dropdown-item" href="calendar.html">Kalender Ansicht</a>
                                <a class="dropdown-item" href="timeline.html">Timeline</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Register
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="persons.html">Personen</a>
                                <a class="dropdown-item" href="places.html">Orte</a>
                                <a class="dropdown-item" href="orgs.html">Institutionen</a>
                                <a class="dropdown-item" href="terms.html">Schlagworte</a>
                                <div class="dropdown-divider"/>
                                <a class="dropdown-item" href="../analyze/beacon.xql">GND-BEACON</a>
                                <a class="dropdown-item" href="../data/indices/cmfi.xml">CMIF</a>
                            </div>
                        </li>
                    </ul>
                    <form method="get" action="ft_search.html" class="form-inline my-2 my-lg-0">
                        <input name="searchexpr" class="form-control mr-sm-2" type="text" placeholder="Suche in allen Dokumenten" aria-label="Suchen"/>
                        <button class="btn btn-main btn-outline-primary btn-mg" type="submit">Suchen</button>
                    </form>
                </div>
            </nav>
        </header>
    </xsl:template>
</xsl:stylesheet>