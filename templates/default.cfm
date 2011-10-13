<cfoutput>
	<html>
		<head>
			<cfinclude template="inc/html_head.cfm" />
		</head>
	</html>
	<body>
		<div id="leftNav">
			<cfinclude template="inc/left.cfm" />
		</div>
		<div id="rightContent">
			<div class="content">
				#$.dspBody(body=$.content('body'), pagetitle=$.content('title'), crumblist=0, showMetaImage=0)#
			</div>
		</div>
	</body>
</cfoutput>