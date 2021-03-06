u:Gem::Specification�["
1.3.5i"soleone-highriseU:Gem::Version["0.13.3Iu:	Time�S�    :@marshal_with_utc_coercionF"%Ruby wrapper around Highrise APIU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[	o:Gem::Dependency	:
@type:runtime:@version_requirement0:@version_requirementsU;[[[">=U; ["2.2:
@name"activeresourceo;		;
;;0;U;[[[">=U; ["2.1;"activesupporto;		;
;;0;U;[[[">=U; ["0;"	curbo;		;
;;0;U;[[[">=U; ["0;"hpricot0"kmayer@bitwrangler.com["Marcos Tapaj&#243;s"Ken Mayer"Dennis Theisen"�
Based on the original API module from DHH, http://developer.37signals.com/highrise/, this
gem is a cleaned up, tested version of the same. Contributors have added support for tags 
which are not supported by the API directly

Configure by adding the following:

require 'highrise'
Highrise::Base.site = 'http://your_site.highrisehq.com/'
Highrise::Base.user = 'your_api_auth_token'
                          "&http://github.com/kmayer/highriseT@[ 