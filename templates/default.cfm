<cfif $.content('contentID') eq '00000000000000000000000000000000001'> 
	<cfif isDefined('url.left')>
		<cfinclude template="inc/left.cfm" />
	<cfelseif isDefined('url.right')>
		<cfinclude template="defaultRight.cfm" />
	<cfelse>
		<cfinclude template="inc/frameset.cfm" />
	</cfif>
<cfelse>
	<cfinclude template="defaultRight.cfm" />
</cfif>