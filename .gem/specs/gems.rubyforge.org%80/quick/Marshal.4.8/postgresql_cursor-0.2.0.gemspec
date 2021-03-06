u:Gem::SpecificationQ["
1.3.6i"postgresql_cursorU:Gem::Version["
0.2.0Iu:	Time$��    :@marshal_with_utc_coercionF"^ActiveRecord PostgreSQL Adapter extension for using a cursor to return a large result setU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[["<=U; ["
2.3.5:
@type:runtime:@requirement@ :@prereleaseF:
@name"activerecordo;	
;
U;[[[">=U; ["0;;;@*;F;"pg0"allen.fair@gmail.com["Allen Fair"BPostgreSQL Cursor is an extension to the ActiveRecord PostgreSQLAdapter for very large result sets. It provides a cursor open/fetch/close interface to access data without loading all rows into memory, and instead loads the result rows in "chunks" (default of 10_000 rows), buffers them, and returns the rows one at a time.".http://github.com/afair/postgresql_cursorT@[ 