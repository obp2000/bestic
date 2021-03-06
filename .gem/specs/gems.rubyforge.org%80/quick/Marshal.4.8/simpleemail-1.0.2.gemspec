u:Gem::Specification&["
1.3.5i"simpleemailU:Gem::Version["
1.0.2Iu:	Time%��    :@marshal_with_utc_coercionF"LThis package simplifies sending emails outside of the Rails environmentU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[
o:Gem::Dependency	:
@type:runtime:@version_requirement0:
@name"actionmailer:@version_requirementsU;[[[">=U; ["0o;		;
;;0;"relative;U;[[[">=U; ["0o;		;
:development;0;"rubyforge;U;[[[">=U; ["
2.0.3o;		;
;;0;"gemcutter;U;[[[">=U; ["
0.3.0o;		;
;;0;"hoe;U;[[[">=U; ["
2.5.0"simpleemail[".technical.inquiries@designingpatterns.com["DesigningPatterns"lThis package simplifies sending emails outside of the Rails
environment.  It is a wrapper around the ActionMailer package.
Support for smtp over tls is included if you are using Ruby 1.8.7 or
above.  The API provided is very bare, but can be easily extended.
The email configuration is provided through a user-specified
configuration file (identical to the ActionMailer configuration in
environment.rb in Rails except for the added tls option).  This
package is most useful in the situation that a user has a number of
scripts (outside of the Rails environment) that all send very basic
emails (to, from, body, subject)."2http://www.rubyforge.org/projects/simpleemailT@[ 