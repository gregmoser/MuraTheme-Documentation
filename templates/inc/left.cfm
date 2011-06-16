<cfoutput>
	<html>
		<head>
			<cfinclude template="html_head.cfm" />
		</head>
	</html>
	<body class="leftBody">
		<div class="leftNav">
			<a href="#$.createHREF('/')#"><img src="#$.content().getImageURL(width="200")#" /></a><br /><br />
			#$.dspDocumentationNav(contentID='00000000000000000000000000000000001', viewDepth=10)#
		</div>
		<a class="navexpander" />
		<a class="navcontractor" />
	</body>
</cfoutput>