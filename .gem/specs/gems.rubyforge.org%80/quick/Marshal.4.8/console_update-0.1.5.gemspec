u:Gem::Specification["
1.3.7i"console_updateU:Gem::Version["
0.1.5u:	Timeģ�    "IEdit your database records via the console and your favorite editor.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["
1.3.6"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
1.1.0:
@name"
bacon:@requirement@ :@prereleaseF:
@type:developmento;
;	U;[[[">=U; ["0;
"
mocha;@*;F;;o;
;	U;[[[">=U; ["0;
"mocha-on-bacon;@4;F;;"tagaholic"gabriel.horner@gmail.com["Gabriel Horner"�Updates records from the console via your preferred editor. You can update a record's columns as well as any attribute that has accessor methods.  Records are edited via a temporary file and once saved, the records are updated. Records go through a filter before and after editing the file. Yaml is the default filter, but you can define your own filter simply with a module and 2 expected methods. See ConsoleUpdate::Filter for more details. Compatible with all major Ruby versions and Rails 2.3.x and up."(http://tagaholic.me/console_update/T@["MIT