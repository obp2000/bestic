u:Gem::Specification["
1.3.5i"mysql_schema_bulk_changeU:Gem::Version["
0.2.0Iu:	Time�g�    :@marshal_with_utc_coercionF"bThis extension to the MysqlAdapter in ActiveRecord enables bulk updates to schema definitionsU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:runtime:@version_requirement0:@version_requirementsU;[[[">=U; ["
2.3.2:
@name"activerecordo;		;
:development;0;U;[[[">=U; ["
1.3.0;"newgemo;		;
;;0;U;[[[">=U; ["
1.8.0;"hoe"mysql_schema_bulk_change["jkj@lenio.dk["Jacob Kjeldahl"�This extension to the MysqlAdapter in ActiveRecord enables bulk updates to schema definitions.

Pr. default when calling connection#add_column the change will be executed a once, but Mysql
allows for multiple changes to be executed in one SQL statement (http://dev.mysql.com/doc/refman/5.1/en/alter-table.html). The advantage of this is that it takes
a lot less time, especially if the table is large.">http://github.com/jacob_kjeldahl/mysql_schema_bulk_changeT@[ 