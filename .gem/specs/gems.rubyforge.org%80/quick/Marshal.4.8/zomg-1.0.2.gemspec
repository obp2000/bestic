u:Gem::Specificationa["
1.2.0i"	zomgU:Gem::Version["
1.0.2Iu:	Time��    :@marshal_with_utc_coercionF"ZOMG is an OMG IDL parserU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:runtime:@version_requirement0:
@name"ruby2ruby:@version_requirementsU;[[[">=U; ["0o;		;
:development;0;"hoe;U;[[[">=U; ["
1.7.0"	zomg["aaronp@rubyforge.org["Aaron Patterson"�ZOMG is an OMG IDL parser.  ZOMG will generate a Ruby AST from an IDL AST, and will even generate ruby (by means of Ruby2Ruby).  == FEATURES/PROBLEMS:  * Parses IDL, generates Ruby * Ships with OMFG the Object Management File Generator * Ignores nested structs/unions * Treats out/inout parameters are DIY  == SYNOPSIS:  In code:  ZOMG::IDL.parse(File.read(ARGV[0])).to_ruby  Command line:  $ omfg lol.idl &gt; roflmao.rb"http://zomg.rubyforge.org/T@0