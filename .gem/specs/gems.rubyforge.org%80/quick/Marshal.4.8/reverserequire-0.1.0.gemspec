u:Gem::SpecificationB["
1.1.1i"reverserequireU:Gem::Version["
0.1.0Iu:	Time�    :@marshal_with_utc_coercionF"{reverse_require requires specific files from the gems which depend on a certain RubyGem and contain the specified pathU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency:@version_requirement0:
@name"hoe:@version_requirementsU;[[[">=U; ["
1.5.1"reverserequire["postmodern.mod3@gmail.com["Postmodern Modulus III"@reverse_require requires specific files from the gems which depend on a certain RubyGem and contain the specified path. Using reverse_require one can allow others to easily extend the functionality of a RubyGem. Simply add reverse_require into the code of your RubyGem:  reverse_require 'my_gem', 'some/path'  Then other gems which depend upon +my_gem+ merely have to provide &lt;tt&gt;some/path&lt;/tt&gt; within their &lt;tt&gt;lib/&lt;/tt&gt; directory, and reverse_require will load them all at run-time. This ability makes designing plug-in systems for a RubyGem trivial."2http://rubyforge.org/projects/reverserequire/T@0