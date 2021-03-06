u:Gem::Specification�["
1.3.7i"arborealU:Gem::Version["
0.1.1u:	Time���    "/Efficient tree structures for ActiveRecordU:Gem::Requirement[[[">=U; ["
1.8.7U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
2.3.0:
@name"activerecord:@requirement@ :@prereleaseF:
@type:runtimeo;
;	U;[[[">=U; ["
2.3.0;
"activesupport;@*;F;;0"mdub@dogbiscuit.org["Mike Williams"�Arboreal is yet another extension to ActiveRecord to support tree-shaped data structures.

Internally, Arboreal maintains a computed "ancestry_string" column, which caches the path from the root of
a tree to each node, allowing efficient retrieval of both ancestors and descendants.

Arboreal surfaces relationships within the tree like "children", "ancestors", "descendants", and "siblings"
as scopes, so that additional filtering/pagination can be performed.
"$http://github.com/mdub/arborealT@[ 