u:Gem::Specification["
1.3.5i"omnifocus-rtU:Gem::Version["
1.0.0Iu:	TimeÈn    :@marshal_with_utc_coercionF"?Plugin for omnifocus gem to provide rt BTS synchronizationU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:runtime:@version_requirement0:
@name"omnifocus:@version_requirementsU;[[[">=U; ["0o;		;
:development;0;"hoe;U;[[[">=U; ["
2.4.0"seattlerb["kushali@rubyforge.org["aja"Plugin for omnifocus gem to provide rt BTS synchronization.

The first time this runs it creates a yaml file in your home directory
for the rt url, username, password, default queue and query.

The query is optional.  If you don't supply it omnifocus-rt will pull all
tickets from the default queue assigned to the specified user.

The use a custom query you must supply it in the config file.  omnifocus-rt
uses the REST interface to RT.  More information about query formatting is
available here: http://wiki.bestpractical.com/view/REST

Example:
:rt_url:   rt
:queue:    QA
:username: user
:password: pass
:query:    "Queue='QA'ANDOwner='Nobody'ANDStatus!='rejected'"",http://rubyforge.org/projects/seattlerbT@[ 