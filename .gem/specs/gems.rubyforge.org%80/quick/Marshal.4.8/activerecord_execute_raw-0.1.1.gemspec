u:Gem::Specification["
1.3.6i"activerecord_execute_rawU:Gem::Version["
0.1.1Iu:	Time`��    :@marshal_with_utc_coercionF"iexecute raw sql on db from ActiveRecord [without fetching inserted ids as done by ActiveRecord-JDBC]U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
1.2.9:
@type:development:@requirement@ :@prereleaseF:
@name"
rspeco;	
;
U;[[[">=U; ["0;;;@*;F;"	yard0""mccraigmccraig@googlemail.com["(mccraig mccraig of the clan mccraig"�ActiveRecord-JDBC fetches ids of inserted records when you call connection.execute(). this
                         gem adds a connection.execute_raw() method which does not fetch inserted ids":http://github.com/trampoline/activerecord_execute_rawT@[ 