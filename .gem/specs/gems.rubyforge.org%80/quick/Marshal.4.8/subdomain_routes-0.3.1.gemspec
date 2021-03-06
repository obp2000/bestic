u:Gem::Specification�["
1.3.5i"subdomain_routesU:Gem::Version["
0.3.1Iu:	Time-e�    :@marshal_with_utc_coercionF"XA Rails library for incorporating subdomains into route generation and recognition.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:runtime:@version_requirement0:@version_requirementsU;[[[">=U; ["
2.2.1:
@name"actionpack0"mdholling@gmail.com["Matthew Hollingworth"�      SubdomainRoutes add subdomain conditions to the Rails routing system. Routes may be restricted to
      one or many specified subdomains. An URL will be recognised only if the host subdomain matches the
      subdomain specified in the route. Route generation is also enhanced, so that the subdomain of a
      generated URL (or path) will be changed if the requested route has a different subdomain to that of
      the current request. Model-based subdomain routes can also be defined.
"0http://github.com/mholling/subdomain_routesT@[ 