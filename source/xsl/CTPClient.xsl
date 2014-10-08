<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" encoding="utf-8" omit-xml-declaration="yes" />

<xsl:template match="/jnlp">
    <jnlp
        codebase="https://world-dropbox.wustl.edu/CTPClient/" >
        <!-- href="{environment/application}.jnlp" > -->

        <information>
            <title>CTP Client</title>
            <vendor>RSNA</vendor>
            <homepage href="http://mircwiki.rsna.org/index.php?title=CTP-The_RSNA_Clinical_Trial_Processor"/>
            <description>WORLD Images DICOM Submission Tool</description>
            <description kind="short">Java Web Start program for transmitting DICOM data to the WORLD Images intake system.</description>
            <!-- <offline-allowed/> -->
        </information>

        <security>
            <all-permissions/>
        </security>

        <resources>
            <j2se version="1.6+"/>
            <jar href="CTPClient.jar"/>
            <jar href="CTP.jar"/>
            <jar href="dcm4che.jar"/>
            <jar href="jdbm.jar"/>
            <jar href="log4j.jar"/>
            <jar href="util.jar"/>
            <jar href="dcm4che-imageio-rle-2.0.25.jar"/>
         </resources>

        <application-desc main-class="client.CTPClient">
            <argument>"windowTitle=World Images Dropbox"</argument>
            <argument>"panelTitle=World Images Dropbox"</argument>
            <argument>"showBrowseButton=yes"</argument>
            <argument>"scpPort=11112"</argument>
            <argument>"helpURL=https://dropbox.world-images.org/"</argument>
            <argument>"acceptNonImageObject=no"</argument>
            <argument>"dialogEnabled=yes"</argument>  
            <argument>"dialogName=DIALOG.xml"</argument>  
            <argument>"showDialogButton=no"</argument>  
            <argument>"daScriptName=DA.script"</argument>  
            <argument>"daLUTName=LUT.properties"</argument>     
            <argument>"httpURL=https://ctp-import.world-images.org:443"</argument>
            <argument>"showURL=no"</argument>
            <argument>"protocol=https"</argument>
            <argument>"host=dropbox.world-images.org"</argument>
            <argument>"application=CTPClient"</argument>
            <!--
            <argument>"@DROPBOXNAME=<xsl:value-of select="params/dropboxname"/>"</argument>
            <argument>"@SITENAME=<xsl:value-of select="params/sitename"/>"</argument>
            <argument>"@PROJECTNAME=<xsl:value-of select="params/projectname"/>"</argument>
            -->
            <!--<xsl:apply-templates select="params/*"/>-->
            <xsl:apply-templates select="params/param"/>
        </application-desc>
    </jnlp>
</xsl:template>

<xsl:template match="param">
    <argument>"<xsl:value-of select="."/>"</argument>
</xsl:template>

</xsl:stylesheet>
