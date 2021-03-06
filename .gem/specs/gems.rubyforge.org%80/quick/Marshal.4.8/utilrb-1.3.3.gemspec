u:Gem::Specification["
1.3.4i"utilrbU:Gem::Version["
1.3.3Iu:	Time�V�    :@marshal_with_utc_coercionF"Yet another Ruby toolkitU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:runtime:
@name"facets:@version_requirementsU;[[[">=U; ["
2.4.0:@version_requirement0o;		;
;;"	rake;U;[[[">=U; ["0;0o;		;
:development;"hoe;U;[[[">=U; ["1.12.2;0"utilrb["sylvain.joyeux@m4x.org["Sylvain Joyeux"0== What is Utilrb ?
Utilrb is yet another Ruby toolkit, in the spirit of facets. It includes all
the standard class extensions I use in my own projects like Genom.rb.

== Installation
The only dependency Utilrb has is flexmock if you want to run tests. It is
available as a gem, so you can run

  gem install flexmock

== Utilrb's C extension
Utilrb includes a C extension in ext/. It is optional, but some of the
functionalities will be disabled if it is not present. Trying to require
a file in which there is a C-only feature will yield a warning on STDOUT." http://utilrb.rubyforge.orgT@[ 