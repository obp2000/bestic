u:Gem::Specificationu["
1.3.5i"ar_after_timestampsU:Gem::Version["
0.2.0Iu:	Time&��    :@marshal_with_utc_coercionF"iRails gem that provides an AR callback right after timestamps are set and before the record is savedU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[
o:Gem::Dependency	:
@type:runtime:@version_requirement0:
@name"activerecord:@version_requirementsU;[[["<U; ["3.0o;		;
:development;0;"mcmire-protest;U;[[["~>U; ["
0.2.4o;		;
;;0;"mcmire-matchy;U;[[["~>U; ["
0.4.1o;		;
;;0;"mcmire-mocha;U;[[["~>U; ["
0.9.8o;		;
;;0;"mocha-protest-integration;U;[[[">=U; ["00"elliot.winkler@gmail.com["Elliot Winkler"�Gem that plugs into Ruby on Rails that gives you a way to add a callback to the ActiveRecord callback chain that will be executed right after the record's timestamp columns are set, but before the record is actually saved to the database. This is useful if you want to do something with the timestamps, such as defaulting another time column to created_at, or rolling back a timestamp by a certain amount."1http://github.com/mcmire/ar_after_timestampsT@[ 