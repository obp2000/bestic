u:Gem::Specification^["
1.3.7i"memflashU:Gem::Version["
1.0.0u:	Timeǡ�    "zMemflash is a gem which enables storing really long values in the Rails FlashHash without writing them to the sessionU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[["~>U; ["
2.3.5:
@name"actionpack:@requirement@ :@prereleaseF:
@type:runtimeo;
;	U;[[["~>U; ["
2.3.5;
"
rails;@*;F;:developmento;
;	U;[[["~>U; ["2.11.0;
"shoulda;@4;F;;0"vladimir@zendesk.com["Vladimir Andrijevik"Memflash is a gem which enables storing really long values in the Rails FlashHash without writing them to the session. Instead, it transparently uses `Rails.cache`, thus enabling the flash in your actions to contain large values, and still fit in a cookie-based session store"'http://github.com/zendesk/memflashT@[ 