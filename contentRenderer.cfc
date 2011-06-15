<cfcomponent extends="mura.content.contentRenderer">
	
	<cffunction name="dspDocumentationNav" output="false" returntype="string">
		<cfargument name="contentid" type="string" >
		<cfargument name="viewDepth" type="numeric" required="true" default="1">
		<cfargument name="currDepth" type="numeric"  required="true"  default="1">
		<cfargument name="type" type="string"  default="default">
		<cfargument name="today" type="date"  default="#now()#">
		<cfargument name="class" type="string" default="">
		<cfargument name="querystring" type="string" default="">
		<cfargument name="sortBy" type="string" default="orderno">
		<cfargument name="sortDirection" type="string" default="asc">
		<cfargument name="context" type="string" default="#application.configBean.getContext()#">
		<cfargument name="stub" type="string" default="#application.configBean.getStub()#">
		<cfargument name="categoryID" type="string" default="">
		<cfargument name="relatedID" type="string" default="">
		<cfargument name="rs" required="true" default="">
		<cfargument name="subNavExpression" required="true" default="">
		
		<cfset var rsSection=arguments.rs>
		<cfset var adjust=0>
		<cfset var current=0>
		<cfset var link=''>
		<cfset var itemClass=''>
		<cfset var isCurrent=false>
		<cfset var nest=''>
		<cfset var subnav=false>
		<cfset var theNav="">
		
		<cfif not isQuery(rsSection)>
			<cfset rsSection=application.contentGateway.getKids('00000000000000000000000000000000000',event.getValue('siteID'),arguments.contentid,arguments.type,arguments.today,50,'',0,arguments.sortBy,arguments.sortDirection,arguments.categoryID,arguments.relatedID)>
		</cfif>
		
		<cfif rsSection.recordcount and ((event.getValue('r').restrict and event.getValue('r').allow) or (not event.getValue('r').restrict))>
			<cfset adjust=rsSection.recordcount>
			<cfsavecontent variable="theNav">
			<cfoutput>
			<ul #iif(arguments.class neq '',de(' class="#arguments.class #"'),de(''))#>
			<cfloop query="rsSection">
				<cfif allowLink(rssection.restricted,rssection.restrictgroups,event.getValue('r').loggedIn)>
					<cfsilent>
						
						<cfset current=current+1>
						<cfset nest=''>
						
						<cfif len(arguments.subNavExpression)>
							<cfset subnav=evaluate(arguments.subNavExpression)>
						<cfelse>
							<cfset subnav=(((ListFind("Page,Portal,Calendar",rsSection.type)) and arguments.class eq 'navSecondary' and (this.crumbData[this.navSelfIdx].contentID eq rsSection.contentid or this.crumbData[this.navSelfIdx].parentID eq rsSection.contentid) ) or ((listFindNoCase("Page,Calendar",rsSection.type)) and arguments.class neq 'navSecondary')) and arguments.currDepth lt arguments.viewDepth and rsSection.type neq 'Gallery' and not (rsSection.restricted and not session.mura.isLoggedIn) >
						</cfif>
						
						<cfif subnav>
							<cfset nest=dspDocumentationNav(rssection.contentid,arguments.viewDepth,arguments.currDepth+1,iif(rssection.type eq 'calendar',de('fixed'),de('default')),now(),'','',rsSection.sortBy,rsSection.sortDirection,arguments.context,arguments.stub,arguments.categoryID,arguments.relatedID,"",arguments.subNavExpression) />
						</cfif>
						
						<cfset itemClass=iif(current eq 1,de('first'),de(iif(current eq adjust,de('last'),de('')))) />
						<cfset isCurrent=listFind(event.getValue('contentBean').getPath(),"#rsSection.contentid#") />
						
						<cfif isCurrent>
							<cfset itemClass=listAppend(itemClass,"current"," ")>
						</cfif>
						
						<cfset link=addDocumentationLink(rsSection.type,rsSection.filename,rsSection.menutitle,'right',rsSection.targetParams,rsSection.contentid,event.getValue('siteID'),arguments.querystring,arguments.context,arguments.stub)>
						
					</cfsilent>
					<li<cfif len(itemClass)> class="#itemClass#"</cfif>>
						<cfif subnav and find("<li",nest)><img src="#$.siteConfig('themeAssetPath')#/images/plus.gif" class="navexpander" /><cfelse><img src="#$.siteConfig('themeAssetPath')#/images/blank.gif" /></cfif>#link#
						<cfif subnav and find("<li",nest)>#nest#<cfelse></cfif>
					</li>
				<cfelse>
					<cfset adjust=adjust-1>
				</cfif>
			</cfloop>
			</ul></cfoutput>
			</cfsavecontent>
		</cfif>
		<cfreturn theNav />
	</cffunction>
	
	<cffunction name="addDocumentationLink" output="false" returntype="string">
		<cfargument name="type" required="true">
		<cfargument name="filename" required="true">
		<cfargument name="title" required="true">
		<cfargument name="target" type="string"  default="">
		<cfargument name="targetParams" type="string"  default="">
		<cfargument name="contentid" required="true">
		<cfargument name="siteid" required="true">
		<cfargument name="querystring" type="string" required="true" default="">
		<cfargument name="context" type="string" required="true" default="#application.configBean.getContext()#">
		<cfargument name="stub" type="string" required="true" default="#application.configBean.getStub()#">
		<cfargument name="indexFile" type="string" required="true" default="">
		<cfargument name="showMeta" type="string" required="true" default="0">
		<cfargument name="showCurrent" type="string" required="true" default="1">
		<cfargument name="class" type="string" required="true" default="">
		<cfargument name="complete" type="boolean" required="true" default="false">
		<cfargument name="id" type="string" required="true" default="">

					
		<cfset var link ="">
		<cfset var href ="">
		<cfset var theClass =arguments.class>
		
		<cfif arguments.showCurrent and listFind(event.getValue('contentBean').getPath(),"#arguments.contentID#")>					
			<cfset theClass=listAppend(theClass,"current"," ") />
		</cfif>
		
		<cfset href=createHREF(arguments.type,arguments.filename,arguments.siteid,arguments.contentid,arguments.target,iif(arguments.filename eq event.getValue('contentBean').getfilename(),de(''),de(arguments.targetParams)),arguments.queryString,arguments.context,arguments.stub,arguments.indexFile,arguments.complete,arguments.showMeta)>
		<cfset link='<a href="#href#"#iif(len(theClass),de(' class="#theClass#"'),de(""))##iif(len(arguments.id),de(' id="#arguments.id#"'),de(""))# target="right">#HTMLEditFormat(arguments.title)#</a>' />

		<cfreturn link>
	</cffunction>
	
</cfcomponent>