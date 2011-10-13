<cfoutput>
	<a href="#$.createHREF('/')#"><img src="#$.siteConfig('themeAssetPath')#/images/logo.gif" class="topLogo" /></a>
	<div class="navTree">
		#$.dspDocumentationNav(contentID='00000000000000000000000000000000001', viewDepth=10)#
		<a class="navexpander"></a>
		<a class="navcontractor"></a>
	</div>
</cfoutput>