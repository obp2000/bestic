u:Gem::SpecificationW["
1.3.4i"rutema_elementsU:Gem::Version["
0.1.4Iu:	Time�Y�    :@marshal_with_utc_coercionF"srutema elements provides modules that can be used with custom parsers to add elements to rutema specificationsU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:runtime:
@name"rutema:@version_requirementsU;[[[">=U; ["
1.0.0:@version_requirement0o;		;
;;"
patir;U;[[[">=U; ["
0.6.1;0o;		;
:development;"hoe;U;[[[">=U; ["
2.3.2;0"
patir"riva@braveworld.net["Vassilis Rizopoulos"#== DESCRIPTION:
Rutema Elements modules are the easiest way to add functionality to rutema parsers.
Just derive your parser from the basic rutema parser and include the module of your choice 

 class MyParser &lt; Rutema::MinimalXMLParser
	include Rutema::Elements::IIS
	include Rutema::Elements::Standard
 end

and voila! your parser now understands how to reset IIS, wait and fail!

== FEATURES/PROBLEMS:
Easy addition of extra functionality for rutema

IIS, MSTest and SQLServer modules are windows specific as they use the MS commandline tools0T@[ 