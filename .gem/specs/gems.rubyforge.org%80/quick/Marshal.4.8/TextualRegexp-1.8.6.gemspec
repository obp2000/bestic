u:Gem::Specification�["
0.9.4i"TextualRegexpU:Gem::Version["
1.8.6Iu:	Time���    :@marshal_with_utc_coercionF"/An english wrapper for Regular ExpressionsU:Gem::Requirement[[[">U; ["
0.0.00"	ruby[o:Gem::Dependency:@version_requirement0:
@name"hoe:@version_requirementsU;[[[">=U; ["
1.3.0"texrex"ari [at] aribrown.com[" Ari Brown and Robert Kremme"== FEATURES/PROBLEMS:  Incompatible with 1.9, as far as we know. Technically, it supports everything current RegExp does.  == SYNOPSIS:  Password = TextualRegexp.new do anchor :beginning  group :capture do any :letter repeat(4..13) do any :char end any :digit end end"'    by Ari Brown and Robert KremmeT@0