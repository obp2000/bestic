u:Gem::SpecificationS["
1.3.6i"accept_values_forU:Gem::Version["
0.3.0Iu:	Timeu��    :@marshal_with_utc_coercionF"uIn order to test a complex validation for ActiveRecord models Implemented accept_values_for custom rspec matcherU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["0:@requirement@ :
@type:runtime:@prereleaseF:
@name"activerecordo;	
;
U;[[[">=U; ["0;@*;;;F;"
rspec0"agresso@gmail.com["Bogdan Gusiev"-Rspec: When you have a complex validation(e.g. regexp or custom method) on ActiveRecord model
you have to write annoying easy specs on which values should be accepted by your validation method and which should not.
accepts_values_for rspec matcher simplify the code. See example for more information.
"/http://github.com/bogdan/accept_values_forT@[ 