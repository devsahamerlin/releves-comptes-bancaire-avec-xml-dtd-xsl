<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Opérations de crédit</title>
                <style>
                    table { border-collapse: collapse; width: 100%; margin-top: 20px; }
                    th, td { border: 1px solid black; padding: 8px; text-align: left; }
                    .total { font-weight: bold; background-color: #f2f2f2; }
                    h2 { color: #333; margin-top: 20px; }
                </style>
            </head>
            <body>
                <h1>Opérations de crédit du relevé</h1>
                <p>RIB: <xsl:value-of select="releve/@RIB"/></p>
                <p>Date du relevé: <xsl:value-of select="releve/dateReleve"/></p>
                <p>Solde: <xsl:value-of select="releve/solde"/> </p>
                
                <h2>Opérations</h2>
                <table>
                    <tr>
                        <th>Date</th>
                        <th>Description</th>
                        <th>Montant</th>
                    </tr>
                    <xsl:for-each select="releve/operations/operation[@type='CREDIT']">
                        <tr>
                            <td><xsl:value-of select="@date"/></td>
                            <td><xsl:value-of select="@description"/></td>
                            <td><xsl:value-of select="@montant"/> </td>
                        </tr>
                    </xsl:for-each>
                    <tr class="total">
                        <td colspan="2">Total des crédits:</td>
                        <td>
                            <xsl:value-of select="sum(releve/operations/operation[@type='CREDIT']/@montant)"/>
                        </td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>