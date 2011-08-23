<!--- This file is part of Mura CMS.

Mura CMS is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, Version 2 of the License.

Mura CMS is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Mura CMS. If not, see <http://www.gnu.org/licenses/>.

Linking Mura CMS statically or dynamically with other modules constitutes
the preparation of a derivative work based on Mura CMS. Thus, the terms and 	
conditions of the GNU General Public License version 2 (GPL) cover the entire combined work.

However, as a special exception, the copyright holders of Mura CMS grant you permission
to combine Mura CMS with programs or libraries that are released under the GNU Lesser General Public License version 2.1.

In addition, as a special exception, the copyright holders of Mura CMS grant you permission
to combine Mura CMS with independent software modules that communicate with Mura CMS solely
through modules packaged as Mura CMS plugins and deployed through the Mura CMS plugin installation API,
provided that these modules (a) may only modify the /trunk/www/plugins/ directory through the Mura CMS
plugin installation API, (b) must not alter any default objects in the Mura CMS database
and (c) must not alter any files in the following directories except in cases where the code contains
a separately distributed license.

/trunk/www/admin/
/trunk/www/tasks/
/trunk/www/config/
/trunk/www/requirements/mura/

You may copy and distribute such a combined work under the terms of GPL for Mura CMS, provided that you include
the source code of that other code when and as the GNU GPL requires distribution of source code.

For clarity, if you create a modified version of Mura CMS, you are not obligated to grant this special exception
for your modified version; it is your choice whether to do so, or to make such modified version available under
the GNU General Public License version 2 without this exception. You may, if you choose, apply this exception
to your own modified versions of Mura CMS.
--->
<cfcomponent extends="mura.bean.bean" output="false">

<cfproperty name="feedID" type="string" default="" required="true" />
<cfproperty name="siteID" type="string" default="" required="true" />
<cfproperty name="dateCreated" type="date" default="" required="true" />
<cfproperty name="lastUpdate" type="date" default="" required="true" />
<cfproperty name="lastUpdateBy" type="string" default="" required="true" />
<cfproperty name="name" type="string" default="" required="true" />
<cfproperty name="altName" type="string" default="" required="true" />
<cfproperty name="lang" type="string" default="en-us" required="true" />
<cfproperty name="isActive" type="numeric" default="1" required="true" />
<cfproperty name="showNavOnly" type="numeric" default="1" required="true" />
<cfproperty name="isPublic" type="numeric" default="0" required="true" />
<cfproperty name="isDefault" type="numeric" default="0" required="true" />
<cfproperty name="description" type="string" default="" required="true" />
<cfproperty name="contentID" type="string" default="" required="true" />
<cfproperty name="categoryID" type="string" default="" required="true" />
<cfproperty name="maxItems" type="numeric" default="20" required="true" />
<cfproperty name="allowHTML" type="numeric" default="1" required="true" />
<cfproperty name="isFeaturesOnly" type="numeric" default="0" required="true" />
<cfproperty name="restricted" type="numeric" default="0" required="true" />
<cfproperty name="restrictGroups" type="string" default="" required="true" />
<cfproperty name="version" type="string" default="RSS 2.0" required="true" />
<cfproperty name="channelLink" type="string" default="" required="true" />
<cfproperty name="type" type="string" default="local" required="true" />
<cfproperty name="sortBy" type="string" default="lastUpdate" required="true" />
<cfproperty name="sortDirection" type="string" default="desc" required="true" />
<cfproperty name="parentID" type="string" default="" required="true" />
<cfproperty name="nextN" type="numeric" default="20" required="true" />
<cfproperty name="displayName" type="numeric" default="0" required="true" />
<cfproperty name="displayRatings" type="numeric" default="0" required="true" />
<cfproperty name="displayComments" type="numeric" default="0" required="true" />
<cfproperty name="displayKids" type="numeric" default="0" required="true" />
<cfproperty name="isNew" type="numeric" default="0" required="true" />
<cfproperty name="advancedParams" type="query" default="" required="true" />
<cfproperty name="remoteID" type="string" default="" required="true" />
<cfproperty name="remoteSourceURL" type="string" default="" required="true" />
<cfproperty name="remotePubDAte" type="string" default="" required="true" />

<cffunction name="init" returntype="any" output="false" access="public">
	<cfset super.init(argumentCollection=arguments)>
	
	<cfset variables.instance.feedID=""/>
	<cfset variables.instance.siteID=""/>
	<cfset variables.instance.dateCreated="#now()#"/>
	<cfset variables.instance.lastUpdate="#now()#"/>
	<cfset variables.instance.lastUpdateBy=""/>
	<cfset variables.instance.name=""/>
	<cfset variables.instance.altName=""/>
	<cfset variables.instance.Lang="en-us"/>
	<cfset variables.instance.isActive=1 />
	<cfset variables.instance.showNavOnly=1 />
	<cfset variables.instance.isPublic=0 />
	<cfset variables.instance.isDefault=0 />
	<cfset variables.instance.description=""/>
	<cfset variables.instance.contentID=""/>
	<cfset variables.instance.categoryID=""/>
	<cfset variables.instance.MaxItems=20 />
	<cfset variables.instance.allowHTML=1 />
	<cfset variables.instance.isFeaturesOnly=0 />
	<cfset variables.instance.restricted=0 />
	<cfset variables.instance.restrictGroups="" />
	<cfset variables.instance.Version="RSS 2.0" />
	<cfset variables.instance.ChannelLink="" />
	<cfset variables.instance.type="local" />
	<cfset variables.instance.sortBy="lastUpdate" />
	<cfset variables.instance.sortDirection="desc" />
	<cfset variables.instance.parentID="" />
	<cfset variables.instance.nextN=20 />
	<cfset variables.instance.displayName=0 />
	<cfset variables.instance.displayRatings=0 />
	<cfset variables.instance.displayComments=0 />
	<cfset variables.instance.displayKids=0 />
	<cfset variables.instance.isNew=1 />
	<cfset variables.instance.advancedParams=queryNew("feedID,param,relationship,field,condition,criteria,dataType","varchar,integer,varchar,varchar,varchar,varchar,varchar" )  />
	<cfset variables.instance.errors=structnew() />
	<cfset variables.instance.remoteID = "" />
	<cfset variables.instance.remoteSourceURL = "" />
	<cfset variables.instance.remotePubDate = "">
	
	<cfreturn this />
</cffunction>

<cffunction name="set" returnType="any" output="false" access="public">
	<cfargument name="feed" type="any" required="true">
	<cfset var prop=""/>
		
	<cfif isQuery(arguments.feed) and arguments.feed.recordcount>
		<cfloop list="#arguments.feed.columnlist#" index="prop">
			<cfset setValue(prop,arguments.feed[prop][1]) />
		</cfloop>
		
	<cfelseif isStruct(arguments.feed)>
		<cfloop collection="#arguments.feed#" item="prop">
			<cfset setValue(prop,arguments.feed[prop]) />
		</cfloop>
		
		<cfset setAdvancedParams(arguments.feed) />
	</cfif>
		
	<cfreturn this />
</cffunction>

<cffunction name="setDateCreated" access="public" output="false">
	<cfargument name="dateCreated" type="String" />
	<cfset variables.instance.dateCreated = parseDateArg(arguments.dateCreated) />
	<cfreturn this>
</cffunction>

<cffunction name="setLastUpdate" access="public" output="false">
	<cfargument name="lastUpdate" type="String" />
	<cfset variables.instance.lastUpdate = parseDateArg(arguments.lastUpdate) />
	<cfreturn this>
</cffunction>

<cffunction name="setContentID" access="public" output="false">
	<cfargument name="contentID" type="String" />
	<cfargument name="append" type="boolean" default="false" required="true" />
	<cfset var i="">
	
	<cfif not arguments.append>
		<cfset variables.instance.contentID = trim(arguments.contentID) />
	<cfelse>
		<cfloop list="#arguments.contentID#" index="i">
		<cfif not listFindNoCase(variables.instance.contentID,trim(i))>
	    	<cfset variables.instance.contentID = listAppend(variables.instance.contentID,trim(i)) />
	    </cfif> 
	    </cfloop>
	</cfif>
	<cfreturn this>
</cffunction>

<cffunction name="setCategoryID" access="public" output="false">
	<cfargument name="categoryID" type="String" />
	<cfargument name="append" type="boolean" default="false" required="true" />
	<cfset var i="">
	
	<cfif not arguments.append>
		<cfset variables.instance.categoryID = trim(arguments.categoryID) />
	<cfelse>
		<cfloop list="#arguments.categoryID#" index="i">
		<cfif not listFindNoCase(variables.instance.categoryID,trim(i))>
	    	<cfset variables.instance.categoryID = listAppend(variables.instance.categoryID,trim(i)) />
	    </cfif> 
	    </cfloop>
	</cfif>
	<cfreturn this>
</cffunction>

<cffunction name="setNextN" access="public" output="false">
	<cfargument name="NextN" type="any" />
	<cfif isNumeric(arguments.nextN)>
	<cfset variables.instance.NextN = arguments.NextN />
	</cfif>
	<cfreturn this>
</cffunction>

<cffunction name="setDisplayName" access="public" output="false">
	<cfargument name="DisplayName" type="any" />
	<cfif isNumeric(arguments.DisplayName)>
	<cfset variables.instance.DisplayName = arguments.DisplayName />
	</cfif>
	<cfreturn this>
</cffunction>

<cffunction name="setDisplayRatings" access="public" output="false">
	<cfargument name="DisplayRatings" type="any" />
	<cfif isNumeric(arguments.DisplayRatings)>
	<cfset variables.instance.DisplayRatings = arguments.DisplayRatings />
	</cfif>
	<cfreturn this>
</cffunction>

<cffunction name="setDisplayComments" access="public" output="false">
	<cfargument name="DisplayComments" type="any" />
	<cfif isNumeric(arguments.DisplayComments)>
	<cfset variables.instance.DisplayComments = arguments.DisplayComments />
	</cfif>
	<cfreturn this>
</cffunction>

<cffunction name="setDisplayKids" access="public" output="false">
	<cfargument name="DisplayKids" type="any" />
	<cfif isNumeric(arguments.DisplayKids)>
	<cfset variables.instance.displayKids = arguments.DisplayKids />
	</cfif>
	<cfreturn this>
</cffunction>

<cffunction name="setShowNavOnly" access="public" output="false">
	<cfargument name="showNavOnly" type="any" />
	<cfif isBoolean(arguments.showNavOnly)>
	<cfset variables.instance.showNavOnly = arguments.showNavOnly />
	</cfif>
	<cfreturn this>
</cffunction>

<cffunction name="setAdvancedParams" access="public" output="false">
	<cfargument name="params" type="any" required="true">
		
	<cfset var rows=0/>
	<cfset var I = 0 />
		
	<cfif isquery(arguments.params)>
			
		<cfset variables.instance.advancedParams=arguments.params />
			
	<cfelseif isdefined('arguments.params.param')>
	
		<cfset clearAdvancedParams() />
		<cfloop from="1" to="#listLen(arguments.params.param)#" index="i">
			
			<cfset addAdvancedParam(
					listFirst(evaluate('arguments.params.paramField#i#'),'^'),
					evaluate('arguments.params.paramRelationship#i#'),
					evaluate('arguments.params.paramCriteria#i#'),
					evaluate('arguments.params.paramCondition#i#'),
					listLast(evaluate('arguments.params.paramField#i#'),'^')
					) />
		</cfloop>
			
	</cfif>
	
	<cfreturn this>
</cffunction>


<cffunction name="addAdvancedParam" access="public" output="false">
	<cfargument name="field" type="string" required="true" default="">
	<cfargument name="relationship" type="string" default="and" required="true">
	<cfargument name="criteria" type="string" required="true" default="">
	<cfargument name="condition" type="string" default="EQUALS" required="true">
	<cfargument name="datatype" type="string"  default="varchar" required="true">
	
	<cfset var rows=1/>
		
	<cfset queryAddRow(variables.instance.advancedParams,1)/>
	<cfset rows = variables.instance.advancedParams.recordcount />
	<cfset querysetcell(variables.instance.advancedParams,"feedid",variables.instance.feedID,rows)/>
	<cfset querysetcell(variables.instance.advancedParams,"param",rows,rows)/>
	<cfset querysetcell(variables.instance.advancedParams,"field",arguments.field,rows)/>
	<cfset querysetcell(variables.instance.advancedParams,"relationship",arguments.relationship,rows)/>
	<cfset querysetcell(variables.instance.advancedParams,"criteria",arguments.criteria,rows)/>
	<cfset querysetcell(variables.instance.advancedParams,"condition",arguments.condition,rows)/>
	<cfset querysetcell(variables.instance.advancedParams,"dataType",arguments.datatype,rows)/>
	<cfreturn this>
</cffunction>

<cffunction name="addParam" access="public" output="false" hint="This is the same as addAdvancedParam.">
	<cfargument name="field" type="string" required="true" default="">
	<cfargument name="relationship" type="string" default="and" required="true">
	<cfargument name="criteria" type="string" required="true" default="">
	<cfargument name="condition" type="string" default="EQUALS" required="true">
	<cfargument name="datatype" type="string"  default="varchar" required="true">
	<cfset addAdvancedParam(argumentcollection=arguments)>
	<cfreturn this>
</cffunction>


<cffunction name="clearAdvancedParams" output="false">
	<cfset variables.instance.advancedParams=queryNew("feedID,param,relationship,field,condition,criteria,dataType","varchar,integer,varchar,varchar,varchar,varchar,varchar" )  />
	<cfreturn this>
</cffunction>

<cffunction name="renderName" returntype="String" access="public" output="false">	
	<cfif len(variables.instance.altName)>
		<cfreturn variables.instance.altName />
	<cfelse>
		<cfreturn variables.instance.name />
	</cfif>
</cffunction>

<cffunction name="getQuery" returnType="query" output="false" access="public">
	<cfargument name="aggregation" required="true" default="false">
	<cfreturn getBean("feedManager").getFeed(this,"",arguments.aggregation) />
</cffunction>

<cffunction name="getIterator" returnType="any" output="false" access="public">
	<cfargument name="aggregation" required="true" default="false">
	<cfset var q=getQuery(aggregation=arguments.aggregation) />
	<cfset var it=getBean("contentIterator")>
	<cfset it.setQuery(q,variables.instance.nextn)>
	<cfreturn it>
</cffunction>

<cffunction name="save" returnType="any" output="false" access="public">
	<cfset setAllValues(getBean("feedManager").save(this).getAllValues())>
	<cfreturn this />
</cffunction>

<cffunction name="delete" output="false" access="public">
	<cfset getBean("feedManager").delete(variables.instance.feedID) />
</cffunction>

<cffunction name="loadBy" returnType="any" output="false" access="public">
	<cfset var response="">
	
	<cfif not structKeyExists(arguments,"siteID")>
		<cfset arguments.siteID=variables.instance.siteID>
	</cfif>
	
	<cfset response=getBean("feedManager").read(argumentCollection=arguments)>

	<cfif isArray(response)>
		<cfset setAllValues(response[1].getAllValues())>
		<cfreturn response>
	<cfelse>
		<cfset setAllValues(response.getAllValues())>
		<cfreturn this>
	</cfif>
</cffunction>

<cffunction name="setRemotePubDate" output="false" access="public">
    <cfargument name="RemotePubDate" type="string" required="true">
	<cfif lsisDate(arguments.RemotePubDate)>
		<cftry>
		<cfset variables.instance.RemotePubDate = lsparseDateTime(arguments.RemotePubDate) />
		<cfcatch>
			<cfset variables.instance.RemotePubDate = arguments.RemotePubDate />
		</cfcatch>
		</cftry>
		<cfelse>
		<cfset variables.instance.RemotePubDate = ""/>
	</cfif>
	<cfreturn this>
  </cffunction>

<cffunction name="getEditUrl" access="public" returntype="string" output="false">
	<cfargument name="compactDisplay" type="any" required="true" default="false"/>
	<cfset var returnStr="">
	
	<cfset returnStr= "#variables.configBean.getContext()#/admin/?fuseaction=cFeed.edit&feedID=#variables.instance.feedID#&siteid=#variables.instance.siteID#&type=#variables.instance.type#&compactDisplay=#arguments.compactdisplay#" >
	
	<cfreturn returnStr>
</cffunction> 

</cfcomponent>