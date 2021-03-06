u:Gem::SpecificationS["
1.3.7i"(activerecord-mysql2legacydb-adapterU:Gem::Version["
0.2.0u:	Time���    "9Translates table and field names of legacy databasesU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[["~>U; ["
0.2.4:
@name"mysql2:@requirement@ :@prereleaseF:
@type:runtimeo;
;	U;[[["~>U; ["
3.0.0;
"activerecord;@*;F;;o;
;	U;[[[">=U; ["2.0.0.beta.19;
"
rspec;@4;F;:developmento;
;	U;[[["~>U; ["
1.0.0;
"bundler;@>;F;;o;
;	U;[[["~>U; ["1.5.0.pre3;
"jeweler;@H;F;;o;
;	U;[[[">=U; ["0;
"	rcov;@R;F;;o;
;	U;[[[">=U; ["
0.2.4;
"mysql2;@\;F;;o;
;	U;[[[">=U; ["2.0.0.beta.19;
"
rspec;@f;F;;o;
;	U;[[["~>U; ["
1.0.0;
"bundler;@p;F;;o;
;	U;[[["~>U; ["1.5.0.pre3;
"jeweler;@z;F;;o;
;	U;[[[">=U; ["0;
"	rcov;@;F;;0"anders@johannsen.com["Anders Johannsen"cIf you are stuck with a MySQL database where the naming is, well, unrailslike,
    activerecord-mysql2-legacy-db-adapter offers a way to do the translation. It works at the driver level and doesn't
    require you ro change the structure of the database. Also there are no database views which should be kept up to date
    as you add or remove fields.
  "Chttp://github.com/andersjo/activerecord-mysql2legacydb-adapterT@[ 