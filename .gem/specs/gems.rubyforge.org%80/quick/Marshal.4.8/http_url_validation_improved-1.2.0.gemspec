u:Gem::Specification�["
1.3.7i"!http_url_validation_improvedU:Gem::Version["
1.2.0Iu:	Time̕�    :@marshal_with_utc_coercionF"Ea Rails gem that allows you to validate a URL  entered in a formU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["0:
@type:development:@requirement@ :@prereleaseF:
@name"thoughtbot-shoulda0"walter@katipo.co.nz["Erik Gregg"Walter McGinnis"Kieran Pilkington"�a Rails gem that allows you to validate a URL 
entered in a form. It validates if the URL exists by hitting it with a HEAD 
request.

The improved version includes retries for common patterns when the head request is refused before giving a failure notice.

It also looks up a SITE_URL constant to the user agent in the headers.

Also has the option to also check that the URL returns content of 
a specified type."8http://github.com/kete/http_url_validation_improvedT@[ 