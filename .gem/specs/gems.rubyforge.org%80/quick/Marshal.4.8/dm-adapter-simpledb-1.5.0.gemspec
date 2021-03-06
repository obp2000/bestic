u:Gem::Specificationf["
1.3.5i"dm-adapter-simpledbU:Gem::Version["
1.5.0Iu:	TimeE��    :@marshal_with_utc_coercionF"+DataMapper adapter for Amazon SimpleDBU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:runtime:@version_requirement0:
@name"dm-core:@version_requirementsU;[[["~>U; ["0.10.0o;		;
;;0;"dm-aggregates;U;[[["~>U; ["0.10.0o;		;
;;0;"dm-migrations;U;[[["~>U; ["0.10.0o;		;
;;0;"dm-types;U;[[["~>U; ["0.10.0o;		;
;;0;"uuidtools;U;[[["~>U; ["2.0o;		;
;;0;"sdbtools;U;[[["~>U; ["0.50"devs@devver.net[
"Jeremy Boles"Edward Ocampo-Gooding"Dan Mayer"Thomas Olausson"Avdi Grimm"|A DataMapper adapter for Amazon's SimpleDB service. 

Features:
 * Full set of CRUD operations
 * Supports all DataMapper query predicates.
 * Can translate many queries into efficient native SELECT operations.
 * Migrations
 * DataMapper identity map support for record caching
 * Lazy-loaded attributes
 * DataMapper Serial property support via UUIDs.
 * Array properties
 * Basic aggregation support (Model.count("..."))
 * String "chunking" permits attributes to exceed the 1024-byte limit

Note: as of version 1.0.0, this gem supports supports the DataMapper 0.10.*
series and breaks backwards compatibility with DataMapper 0.9.*.
"1http://github.com/devver/dm-adapter-simpledbT@[ 