u:Gem::Specification["
1.3.7i"rogerio-augusto-highriseU:Gem::Version["
2.0.4u:	Timeรค    "%Ruby wrapper around Highrise APIU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["2.1:
@name"activeresource:@requirement@ :@prereleaseF:
@type:runtimeo;
;	U;[[[">=U; ["2.1;
"activesupport;@*;F;;0["marcos@tapajos.me"kmayer@bitwrangler.com["Marcos Tapaj&#243;s"Ken Mayer"
Based on the original API module from DHH, http://developer.37signals.com/highrise/, this
gem is a cleaned up, tested version of the same. Contributors have added support for tags 
which are not supported by the API directly

Configure by adding the following:

require 'highrise'
Highrise::Base.site = 'http://your_site.highrisehq.com/'
Highrise::Base.user = 'your_api_auth_token'
                          "'http://github.com/tapajos/highriseT@[ 