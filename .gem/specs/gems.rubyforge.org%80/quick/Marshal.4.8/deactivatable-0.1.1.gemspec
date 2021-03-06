u:Gem::Specification�["
1.3.6i"deactivatableU:Gem::Version["
0.1.1Iu:	Timeċ�    :@marshal_with_utc_coercionF"_Adds methods and scopes to ActiveRecord objects to allow deactivation instead of deletion.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["2.3:
@type:runtime:@requirement@ :@prereleaseF:
@name"activerecordo;	
;
U;[[[">=U; ["0;:development;@*;F;"thoughtbot-shoulda0"greg_fitz@yahoo.com["Greg Fitzgerald"�Deactivatable provides methods and a default_scope to allow ActiveRecord objects to be deactivated instead of deleted.
      This is useful if an object needs to be removed from general use, but it's data needs to be retained.
      Additionally, Deactivatable provides the ability to specify dependencies which also need to be deactivated.
      Deactivation is determined by populating a deactivated_at field with the date time at which deactivation happened.
    "/http://github.com/gregfitz23/deactivatableT@[ 