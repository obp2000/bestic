u:Gem::SpecificationK["
1.3.7i"	hirbU:Gem::Version["
0.3.3u:	Timeĝ�    "^A mini view framework for console/irb that's easy to use, even while under its influence.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["
1.3.6"	ruby[	o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
1.1.0:
@name"
bacon:@requirement@ :@prereleaseF:
@type:developmento;
;	U;[[[">=U; ["0;
"
mocha;@*;F;;o;
;	U;[[[">=U; ["0;
"mocha-on-bacon;@4;F;;o;
;	U;[[[">=U; ["0;
"bacon-bits;@>;F;;"tagaholic"gabriel.horner@gmail.com["Gabriel Horner"�Hirb provides a mini view framework for console applications and uses it to improve irb's default inspect output. Given an object or array of objects, hirb renders a view based on the object's class and/or ancestry. Hirb offers reusable views in the form of helper classes. The two main helpers, Hirb::Helpers::Table and Hirb::Helpers::Tree, provide several options for generating ascii tables and trees. Using Hirb::Helpers::AutoTable, hirb has useful default views for at least ten popular database gems i.e. Rails' ActiveRecord::Base. Other than views, hirb offers a smart pager and a console menu. The smart pager only pages when the output exceeds the current screen size. The menu is used in conjunction with tables to offer two dimensional menus."http://tagaholic.me/hirb/T@["MIT