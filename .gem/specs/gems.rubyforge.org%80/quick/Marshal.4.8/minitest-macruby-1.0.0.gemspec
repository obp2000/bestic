u:Gem::Specification�["
1.3.7i"minitest-macrubyU:Gem::Version["
1.0.0Iu:	Time��    :@marshal_with_utc_coercionF"Lminitest-macruby provides extensions to minitest for macruby UI testingU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[	o:Gem::Dependency
:@version_requirementsU;[[["~>U; ["1.7:@requirement@ :
@type:runtime:@prereleaseF:
@name"minitesto;	
;
U;[[[">=U; ["
2.0.4;@*;:development;F;"rubyforgeo;	
;
U;[[[">=U; ["
1.6.0;@4;;;F;"minitesto;	
;
U;[[[">=U; ["
2.6.1;@>;;;F;"hoe"	bfts["ryand-ruby@zenspider.com["Ryan Davis"9minitest-macruby provides extensions to minitest for macruby UI
testing. It provides a framework to test GUI apps in a live instance.
Documentation and examples are light at the moment as I've just thrown
this together. Suggestions for extensions are very welcome!

Currently it provides the following methods in minitest's assertions:

* self.run_macruby_tests
* find_ui_menu(*path)
* find_ui_menu_items menu
* assert_ui_menu menu, *items
* find_ui_menu_item(*path)
* assert_ui_action obj, target, action, key = nil
* assert_ui_binding item, binding_name, target, path"'http://rubyforge.org/projects/bftsT@[ 