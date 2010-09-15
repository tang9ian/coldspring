<!---
   Copyright 2010 Mark Mandel
   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at
       http://www.apache.org/licenses/LICENSE-2.0
   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

 --->

<cfscript>
	exclude = "";

	if(server.coldfusion.productName != "ColdFusion Server" OR !server.coldfusion.productVersion.startsWith("9"))
	{
		exclude = "cf9";
	}
</cfscript>


<cfinvoke component="mxunit.runner.DirectoryTestSuite"
			method="run"
			directory="#expandPath('/unittests')#"
			componentPath="unittests"
			recurse="true"
			excludes="#exclude#"
			returnvariable="results" />

<cfoutput> #results.getResultsOutput('extjs')# </cfoutput>