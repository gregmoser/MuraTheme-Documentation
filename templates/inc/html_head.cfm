<cfoutput>
	<title>#$.content('title')#</title>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.js"></script>
	<script>!window.jQuery && document.write(unescape('%3Cscript src="js/libs/jquery-1.4.4.js"%3E%3C/script%3E'))</script>
	<script type="text/javascript">
		var plusImage = "#$.siteConfig('themeAssetPath')#/images/plus.gif";
		var minusImage = "#$.siteConfig('themeAssetPath')#/images/minus.gif";
	</script>
	<link rel="stylesheet" href="#$.siteConfig('themeAssetPath')#/css/documentation.css" type="text/css" media="all" />
	<script type="text/javascript" src="#$.siteConfig('themeAssetPath')#/js/documentation.js" />
</cfoutput>