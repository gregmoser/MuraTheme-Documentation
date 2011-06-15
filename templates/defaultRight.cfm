<cfoutput>
	<html>
		<head>
			<cfinclude template="inc/html_head.cfm" />
		</head>
	</html>
	<body class="rightBody">
		<h1>#$.content('title')#</h1>
		<div class="content">
			#$.content('body')#
		</div>
	</body>
</cfoutput>