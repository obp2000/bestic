u:Gem::Specificationy["
1.3.0i"reboundU:Gem::Version["
0.0.2Iu:	Time    :@marshal_with_utc_coercionF"By default, instances of UnboundMethod can only be bound to objects that are a kind_of? the method's original class. This fixes that.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:runtime:@version_requirement0:
@name"ruby2ruby:@version_requirementsU;[[[">=U; ["
1.1.90["patnakajima@gmail.com["Pat Nakajima"By default, instances of UnboundMethod can only be bound to objects that are a kind_of? the method's original class. Pretty lame.  rebound allows unbound methods (instances of UnboundMethod class) to be bound to objects of any class. It uses the alias_method_chain pattern to accomplish this, meaning you also get a bind_without_indifference method that retains the original behavior."'http://github.com/nakajima/reboundT@0