u:Gem::Specification@["
0.9.4i"augmentU:Gem::Version["
1.0.1Iu:	TimeH��    :@marshal_with_utc_coercionF"EAugment is a system for collecting and displaying code metadata.U:Gem::Requirement[[[">U; ["
0.0.00"	ruby[o:Gem::Dependency:@version_requirement0:
@name"miniunit:@version_requirementsU;[[[">=U; ["
1.1.0o;	;
0;"	json;U;[[[">=U; ["
1.1.1o;	;
0;"hoe;U;[[[">=U; ["
1.3.0"augment"technomancy@gmail.com["Phil Hagelberg"X== Usage  The +augment+ executable gathers metadata in the form of layers for a given file via a backend. Some backends gather data for a file other than the original one passed in. (The test backend will store data for the test if you pass in the implementation.)  Example:  $ augment test lib/foo.rb # will store metadata for test/test_foo.rb"#    by Phil Hagelberg (c) 2007T@0