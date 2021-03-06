u:Gem::SpecificationG["
1.3.7i"$rack-methodoverride-with-paramsU:Gem::Version["
1.0.0u:	Time���    "UA replacement for Rack::MethodOverride that looks at query params and post data.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["
1.3.6"	ruby[o:Gem::Dependency
:@version_requirementsU;[[["~>U; ["1:
@name"	rack:@requirement@ :@prereleaseF:
@type:runtimeo;
;	U;[[["~>U; ["2;
"
rspec;@*;F;:development0["ndh@baroquebobcat.com["Nick Howard"2Rack::MethodOverride only checks the X-Http-Method-Override header and the form encoded post body for _method. Rack::MethodOverrideWithParams checks both of those _and_ the query params. So, if you POST xml with a url like http://example.com/?_method=delete the application will see it as a delete request."Dhttp://github.com/baroquebobcat/rack-methodoverride-with-paramsT@[ 