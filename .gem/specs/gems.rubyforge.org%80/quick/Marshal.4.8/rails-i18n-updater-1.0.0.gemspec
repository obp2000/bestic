u:Gem::Specification�["
1.3.7i"rails-i18n-updaterU:Gem::Version["
1.0.0u:	Timev��    "bRails plugin to automatically fetch and update Rails core translations in a Rails applicationU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[	o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["0:
@name"activesupport:@requirement@ :@prereleaseF:
@type:runtimeo;
;	U;[[[">=U; ["0;
"actionpack;@*;F;;o;
;	U;[[[">=U; ["0;
"
rails;@4;F;;o;
;	U;[[[">=U; ["0;
"
mocha;@>;F;:development00["Andreas Neuhaus"tThis Rails plugin provides the rake task i18n:update to download the latest core translations to vendor/rails-locales. On application start, the plugin automatically prepends downloaded core translations to the I18n load_path. So the downloaded core translations are automatically used in your application, but you can still override the defaults in your own locale files."1http://github.com/zargony/rails-i18n-updaterT@[ 