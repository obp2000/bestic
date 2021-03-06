u:Gem::Specification�["
1.3.5i"couchpopulatorU:Gem::Version["
0.2.0Iu:	Timej�    :@marshal_with_utc_coercionF"BFlexible tool for populating CouchDB with generated documentsU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:runtime:@version_requirement0:
@name"	json:@version_requirementsU;[[[">=U; ["
1.2.0o;		;
;;0;"trollop;U;[[[">=U; ["	1.150"sebastian.cohnen@gmx.net["Sebastian Cohnen"�The idea behind this tool is to provide a framework for populating your CouchDB instances with generated documents. It provides a plug-able system for easy writing own generators. Also the the process, which invokes the generator and manages the insertion to CouchDB, what I call execution engines, are easily exchangeable. The default execution engine uses CouchDB's bulk-docs-API with configurable chunk-size, concurrent inserts and total chunks to insert."+http://github.com/tisba/couchpopulatorT@[ 