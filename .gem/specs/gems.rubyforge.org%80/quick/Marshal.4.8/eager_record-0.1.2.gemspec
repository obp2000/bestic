u:Gem::SpecificationR["
1.3.7i"eager_recordU:Gem::Version["
0.1.2Iu:	Time���    :@marshal_with_utc_coercionF"CAutomatic association preloading for ActiveRecord collections.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["0:@prereleaseF:
@type:development:@requirement@ :
@name"
rspec"eager_record"mat@patch.com["Mat Brown"�EagerRecord extends ActiveRecord to automate association preloading. Each time a collection of more than one record is loaded from the database, each record remembers the collection that it is part of; then when one of those records has an association accessed, EagerRecord triggers a preload_associations for all the records in the originating collection. Never worry about that :include option again!"-http://github.com/outoftime/eager_recordT@[ 