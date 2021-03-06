u:Gem::Specification0["
1.3.6i"scoped_searchU:Gem::Version["
2.2.0Iu:	Time6��    :@marshal_with_utc_coercionF"\Easily search you ActiveRecord models with a simple query language using a named scope.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
2.1.0:@prereleaseF:
@type:runtime:@requirement@ :
@name"activerecordo;	
;
U;[[[">=U; ["
1.1.4;F;:development;@*;"
rspec0["willem@railsdoctors.com"weshays@gbdev.com["Willem van Bergen"Wes Hays"�    Scoped search makes it easy to search your ActiveRecord-based models.
    It will create a named scope :search_for that can be called with a query string. It will build an SQL query using
    the provided query string and a definition that specifies on what fields to search. Because the functionality is
    built on named_scope, the result of the search_for call can be used like any other named_scope, so it can be
    chained with another scope or combined with will_paginate."
"4http://wiki.github.com/wvanbergen/scoped_searchT@[ 