u:Gem::Specification�["
1.3.1i"reverse-requireU:Gem::Version["
0.3.1Iu:	TimeA�    :@marshal_with_utc_coercionF"dreverse-require allows one to require files that ends with a specified path from other RubyGemsU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:development:@version_requirement0:
@name"hoe:@version_requirementsU;[[[">=U; ["
1.8.2"reverserequire["postmodern.mod3@gmail.com["Postmodern"�reverse-require allows one to require files that ends with a specified path from other RubyGems.  For instance, if one wanted to require the file 'mylibrary/extensions.rb' from all RubyGems:  require 'reverse_require'  require_all 'mylibrary/extensions' # =&gt; true  One can also require 'mylibrary/extensions.rb' only from RubyGems that depend on the currently loaded version of the mylibrary Gem:  require_for 'mylibrary', 'mylibrary/extensions' # =&gt; true")http://reverserequire.rubyforge.org/T@0