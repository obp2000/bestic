u:Gem::Specification["
0.9.0i"InlineFortranU:Gem::Version["
1.0.0Iu:	TimeƦ�    :@marshal_with_utc_coercionF"'A RubyInline extension for FortranU:Gem::Requirement[[[">U; ["
0.0.00"	ruby[o:Gem::Dependency:@version_requirement0:
@name"hoe:@version_requirementsU;[[[">=U; ["
1.1.2o;	;
0;"RubyInline;U;[[[">U; ["
0.0.0"rubyinline"ryand-ruby@zenspider.com["Ryan Davis"G== FEATURES/PROBLEMS:  * Very rudimentary right now. Needs some love.  == SYNOPSYS:  inline :Fortran do |builder| builder.subroutine('print_integer', [&quot;void&quot;, &quot;int&quot;], &lt;&lt;-END) subroutine print_integer( integer ) integer, intent(in) :: integer print *, 'integer: ', integer end END end  == REQUIREMENTS:"5    http://www.rubyforge.org/projects/rubyinlineT@0