u:Gem::Specificationh["
1.3.5i"rack-domain_redirectU:Gem::Version["
0.1.1Iu:	Time���    :@marshal_with_utc_coercionF"?Rack::DomainRedirect redirects to the configurable domain.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:development:@version_requirement0:
@name"shoulda:@version_requirementsU;[[[">=U; ["2o;		;
;;0;"rack-test;U;[[[">=U; ["0.5o;		;
:runtime;0;"	rack;U;[[[">=U; ["1.10"misza222@gmail.com["Michal Pawlowski"?
Rack::DomainRedirect is a tiny rack middleware for redirecting to the
configurable domain. If user request's the service from domain other than that
configured it redirects to the first domain on the configuration list. If no
domain is configured it does noting and passes requests to another application
in the chain."4http://github.com/misza222/rack-domain_redirectT@[ 