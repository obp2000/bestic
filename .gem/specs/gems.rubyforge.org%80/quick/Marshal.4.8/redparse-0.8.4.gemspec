u:Gem::SpecificationG["
1.3.1i"redparseU:Gem::Version["
0.8.4Iu:	Timeh��    :@marshal_with_utc_coercionF"4RedParse is a ruby parser written in pure ruby.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:runtime:@version_requirement0:
@name"rubylexer:@version_requirementsU;[[["=U; ["
0.7.7o;		;
;;0;"reg;U;[[[">=U; ["
0.4.8"redparse"%caleb (at) inforadical (dot) net["Caleb Clausen"gRedParse is a ruby parser written in pure ruby. Instead of YACC or  ANTLR, it's parse tool is a home-brewed "compiler-interpreter". (The tool is LALR(1)-equivalent and the 'parse language' is pretty nice,  even in it's current crude form.)  My intent is to have a completely correct parser for ruby, in 100%  ruby. Currently, RedParse can parse all known ruby 1.8 constructions correctly. There might be some problems with unparsing or otherwise  working with texts in a character set other than ascii. Some of the new ruby 1.9 constructions are supported in 1.9 mode. For more details on known problems, see below."%http://github.com/coatl/redparseT@0