u:Gem::Specification�["
1.3.7i"sequel_pgU:Gem::Version["
1.0.1u:	Time���    "-Faster SELECTs when using Sequel with pgU:Gem::Requirement[[[">=U; ["
1.8.6U;[[[">=U; ["0"x86-mingw32[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
0.8.0:
@name"pg:@requirement@ :@prereleaseF:
@type:runtimeo;
;	U;[[[">=U; ["
3.6.0;
"sequel;@*;F;;0"code@jeremyevans.net["Jeremy Evans"�sequel_pg overwrites the inner loop of the Sequel postgres
adapter row fetching code with a C version.  The C version
is significantly faster (2-6x) than the pure ruby version
that Sequel uses by default.
",http://github.com/jeremyevans/sequel_pgTo:Gem::Platform:@os"mingw32:	@cpu"x86:@version0[ 