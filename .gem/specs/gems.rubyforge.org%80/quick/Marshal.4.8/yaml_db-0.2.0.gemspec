u:Gem::Specification�["
1.3.7i"yaml_dbU:Gem::Version["
0.2.0u:	Timed��    "Byaml_db allows export/import of database into/from yaml filesU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[ 0"nate@ludicast.com["Adam Wiggins"Orion Henry"�
YamlDb is a database-independent format for dumping and restoring data.  It complements the the database-independent schema format found in db/schema.rb.  The data is saved into db/data.yml.
This can be used as a replacement for mysqldump or pg_dump, but only for the databases typically used by Rails apps.  Users, permissions, schemas, triggers, and other advanced database features are not supported - by design.
Any database that has an ActiveRecord adapter should work
"'http://github.com/ludicast/yaml_dbT@[ 