u:Gem::Specification�["
1.3.6i"activerecord-draft_recordsU:Gem::Version["
0.2.0u:	Time���    "EAdd support for draft models (incomplete models) to ActiveRecordU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
1.2.9:
@name"
rspec:@requirement@ :@prereleaseF:
@type:developmento;
;	U;[[[">=U; ["
0.5.2;
"database_cleaner;@*;F;;0"divoxx@gmail.com["Rodrigo Kochenburger"�Sometimes it's necessary to store incomplete records, without fullfilling all validations, to complete
and then validate the record. ActiveRecord::DraftRecords allows you to persist an record even if it's
invalid by tagging it as a draft.
"8http://github.com/divoxx/activerecord-draft_recordsT@[ 