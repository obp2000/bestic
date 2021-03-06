u:Gem::Specification�["
1.3.6i"arborealU:Gem::Version["
0.1.0Iu:	Time.��    :@marshal_with_utc_coercionF"/Efficient tree structures for ActiveRecordU:Gem::Requirement[[[">=U; ["
1.8.7U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
2.3.0:@prereleaseF:
@type:runtime:@requirement@ :
@name"activerecordo;	
;
U;[[[">=U; ["
2.3.0;F;;;@*;"activesupporto;	
;
U;[[[">=U; ["
1.2.9;F;:development;@4;"
rspec0"mdub@dogbiscuit.org["Mike Williams"�Arboreal is yet another extension to ActiveRecord to support tree-shaped data structures.

Internally, Arboreal maintains a computed "ancestry_string" column, which caches the path from the root of
a tree to each node, allowing efficient retrieval of both ancestors and descendants.

Arboreal surfaces relationships within the tree like "children", "ancestors", "descendants", and "siblings"
as scopes, so that additional filtering/pagination can be performed.
"$http://github.com/mdub/arborealT@[ 