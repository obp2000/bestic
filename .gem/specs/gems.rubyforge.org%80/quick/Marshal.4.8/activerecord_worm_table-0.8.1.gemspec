u:Gem::Specification�["
1.3.6i"activerecord_worm_tableU:Gem::Version["
0.8.1Iu:	Time`��    :@marshal_with_utc_coercionF"(WORM tables for ActiveRecord modelsU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["0:@requirement@ :
@type:development:@prereleaseF:
@name"
rspec0""mccraigmccraig@googlemail.com["(mccraig mccraig of the clan mccraig"�manage WriteOnceReadMany tables backing ActiveRecord models.
                         there will be a switch table and multiple backing tables for each 
                         ActiveRecord model, all created and managed automatically. a new
                         version of a table is created by writing to the working table, and
                         then Model.advance_version which makes the working table active,
                         and creates a new working table from the base model schmea"=http://github.com/mccraigmccraig/activerecord_worm_tableT@[ 