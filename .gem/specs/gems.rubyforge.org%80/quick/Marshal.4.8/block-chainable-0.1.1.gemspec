u:Gem::Specification["
1.1.1i"block-chainableU:Gem::Version["
0.1.1Iu:	Time��    :@marshal_with_utc_coercionF"'tool for building DSLs with blocksU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency:@version_requirement0:
@name"	need:@version_requirementsU;[[[">=U; ["
1.0.1o;	;
0;"
rspec;U;[[[">=U; ["
1.1.3o;	;
0;"hoe;U;[[[">=U; ["
1.5.1"block-chainable"drew@drewolson.org["Drew Olson"*== DESCRIPTION:  BlockChainable is a module to aid in the creation of Domain Specific Languages using block structure. By including BlockChainable into your classes, you will be able to instantiate that class using the class name itself, followed by any parameters to be passed to initialize, followed by a block to be executed within the instantiated class.  BlockChainable also allows methods to search up the chain of classes, meaning that although a block is executed in the scope of the instantiated class, any methods not found in the class but found in a class &quot;up-scope&quot; will be called successfully on the up-scope class. This chaining of method calls allows you to assert values within the blocks as well as calling any other methods from &quot;up-scope&quot; classes.  == FEATURES/PROBLEMS:")http://block-chainable.rubyforge.orgT@0