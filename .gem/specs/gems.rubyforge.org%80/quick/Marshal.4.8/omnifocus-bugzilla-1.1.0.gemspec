u:Gem::Specification["
1.3.5i"omnifocus-bugzillaU:Gem::Version["
1.1.0Iu:	Time�c�    :@marshal_with_utc_coercionF"EPlugin for omnifocus gem to provide bugzilla BTS synchronizationU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:@version_requirementsU;[[[">=U; ["0:
@name"omnifocus:
@type:runtime:@version_requirement0o;		;
U;[[[">=U; ["
2.3.2;"hoe;:development;0"seattlerb["kushali@rubyforge.org["aja"Plugin for omnifocus gem to provide bugzilla BTS synchronization.

The first time this runs it creates a yaml file in your home directory
for the bugzilla url, username, and queries.

The queries config is optional.  If it is not included bugzilla-omnifocus will
pull all active bugs assigned to the specified user.

To use a custom query or multiple queries you must include a queries parameter
in your config.

The queries config is an array of strings.  Each string is the query string
portion of the bugzilla search results url.  Its easiest to create your search
in bugzilla and then paste the portion of the url after the question mark into
the config file.

Example:
:bugzilla_url: http://bugs/buglist.cgi
:username: aja
:queries: [&quot;bug_status=NEW&quot;, &quot;bug_status=CLOSED&quot;]",http://rubyforge.org/projects/seattlerbT@[ 