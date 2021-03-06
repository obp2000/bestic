u:Gem::Specification["
1.3.5i"ar_attr_lazyU:Gem::Version["
0.1.0Iu:	Timef��    :@marshal_with_utc_coercionF"9Rails gem that provides lazy-loading for attributes.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[
o:Gem::Dependency	:
@type:runtime:@version_requirement0:
@name"activerecord:@version_requirementsU;[[["<U; ["3.0o;		;
:development;0;"mcmire-protest;U;[[[">=U; ["0o;		;
;;0;"mcmire-matchy;U;[[[">=U; ["0o;		;
;;0;"mcmire-mocha;U;[[[">=U; ["0o;		;
;;0;"mocha-protest-integration;U;[[[">=U; ["00"elliot.winkler@gmail.com["Elliot Winkler"zA little gem for Rails that provides the ability to specify attributes that will not be loaded when the record is loaded from the database, until you explicitly refer to those attributes. This is useful when you have a lot of text columns in your table; in this case lazy-loading the text attributes is a good way to lend your server a hand and cut down on database access time."*http://github.com/mcmire/ar_attr_lazyT@[ 