u:Gem::Specification�["
1.3.4i"coop_to_ofxU:Gem::Version["
1.0.1Iu:	Time7Y�    :@marshal_with_utc_coercionF"7Convert Co-operative bank HTML statements into OFXU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:runtime:@version_requirement0:
@name"hpricot:@version_requirementsU;[[["~>U; ["
0.6.0o;		;
;;0;"builder;U;[[["~>U; ["
2.1.0o;		;
:development;0;"
rspec;U;[[[">=U; ["0"coop_to_ofx"matt@reprocessed.org["Matt Patterson"�Convert statement HTML from the Co-operative bank's online banking system to OFX for import into financial apps.

= Usage

For a Current Account:

1. Save the HTML source of the statement page.

  coop_to_ofx --current /path/to/statement.html

Will produce /path/to/statement.ofx

For a Credit Card:

1. Save the HTML source of the statement page

  coop_to_ofx /path/to/statement.html

Or

  coop_to_ofx --credit /path/to/statement.html

Will produce /path/to/statement.ofx


To produce OFX 1 SGML (rather than OFX 2 XML):

  coop_to_ofx --ofx1 /path/to/statement.html
  coop_to_ofx --ofx1 --current /path/to/statement.html

To show all the options:

  coop_to_ofx --help 


== To do

XML / SGML validation of output against the specs"http://reprocessed.org/T@[ 