u:Gem::Specification�["
1.3.7i"couchproxyU:Gem::Version["
0.1.0u:	TimeƠ�    "0A proxy server for Apache CouchDB clusters.U:Gem::Requirement[[[">=U; ["
1.9.1U;[[[">=U; ["0"	ruby[	o:Gem::Dependency
:@version_requirementsU;[[["~>U; ["0.2:
@name"em-http-request:@requirement@ :@prereleaseF:
@type:runtimeo;
;	U;[[["~>U; ["1.4;
"	json;@*;F;;o;
;	U;[[["~>U; ["0.1;
"json-stream;@4;F;;o;
;	U;[[["~>U; ["1.2;
"	thin;@>;F;;0""david.malcom.graham@gmail.com["David Graham"�CouchProxy is a simple proxy server that distributes reads and writes to a
cluster of Apache CouchDB servers so they appear to be a single huge database.
Documents are stored and retrieved from a particular CouchDB instance, using
consistent hashing of the document id. Map/reduce views are processed
concurrently on each CouchDB instance and merged together by the proxy before
returning the results to the client.")http://github.com/dgraham/couchproxyT@[ 