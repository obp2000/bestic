u:Gem::Specification.["
1.3.7i"postgresql_cursorU:Gem::Version["
0.3.1u:	TimeĜ�    "^ActiveRecord PostgreSQL Adapter extension for using a cursor to return a large result setU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["0:
@name"activerecord:@requirement@ :@prereleaseF:
@type:runtimeo;
;	U;[[[">=U; ["0;
"pg;@*;F;;0"allen.fair@gmail.com["Allen Fair"BPostgreSQL Cursor is an extension to the ActiveRecord PostgreSQLAdapter for very large result sets. It provides a cursor open/fetch/close interface to access data without loading all rows into memory, and instead loads the result rows in "chunks" (default of 10_000 rows), buffers them, and returns the rows one at a time.".http://github.com/afair/postgresql_cursorT@[ 