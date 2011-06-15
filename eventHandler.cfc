<cfcomponent extends="mura.cfobject">

	<cffunction name="onSiteRequestStart" output="true" returntype="void">
		<cfargument name="$">
		
		<cfif isDefined('url.left')>
			<cfset $.event('themeRenderer').setShowAdminToolBar(false) />
		</cfif>
		
	</cffunction>

</cfcomponent>