u:Gem::SpecificationV["
1.3.1i"octave-rubyU:Gem::Version["
1.0.9Iu:	Time�/�    :@marshal_with_utc_coercionF"9A Ruby interface to the Octave interpreted language.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:development:@version_requirement0:
@name"hoe:@version_requirementsU;[[[">=U; ["
1.8.2"octave-ruby["jonathan@daikini.com["Jonathan Younger"�== USAGE:  require 'octave'  engine = Octave::Engine.new engine.eval &quot;123.456 * 789.101112&quot; engine.rand(10)  matrix = Octave::Matrix.new(20, 400) 20.times { |m| 400.times { |n| matrix[m, n] = rand } } engine.put_variable(&quot;m&quot;, matrix)  engine.save &quot;/tmp/20_x_400_matrix&quot;  == REQUIREMENTS:  * Octave * GCC or some other compiler to build the included extension * Mocha (For testing only)"&http://octave-ruby.rubyforge.org/T@0