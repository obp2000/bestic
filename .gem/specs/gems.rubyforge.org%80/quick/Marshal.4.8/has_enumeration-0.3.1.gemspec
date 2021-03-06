u:Gem::Specifications["
1.3.7i"has_enumerationU:Gem::Version["
0.3.1u:	Time���    ":Support for symbol-based enumerations in ActiveRecordU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[ 0"greg@rujubu.com["Greg Spurrier"XExtends ActiveRecord with the has_enumeration method allowing a symbolic
enumeration to be stored in an ActiveRecord attribute.  The enumeration is
specified as a mapping between symbols and their underlying representation
in the database.  Predicates are provided for each symbol in the enumeration
and the symbols may be used in finder methods.  When using ActiveRecord 3,
the symbols may also be used when interacting with the underlying Arel attribute
for the enumeration.  has_enumeration has been tested with Ruby 1.8.7,
Ruby 1.9.2, JRuby 1.5.1, ActiveRecord 2.3.8, and ActiveRecord 3.0.0.rc2.
"3http://github.com/gregspurrier/has_enumerationT@[ 