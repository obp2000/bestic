u:Gem::Specification�["
1.3.6i"autobuildU:Gem::Version["1.5.18Iu:	Time֙�    :@marshal_with_utc_coercionF"PRake-based utility to build and install multiple packages with dependenciesU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
0.7.0:@prereleaseF:
@type:runtime:@requirement@ :
@name"	rakeo;	
;
U;[[[">=U; ["1.0;F;;;@*;"
rmailo;	
;
U;[[[">=U; ["0.0;F;;;@4;"daemonso;	
;
U;[[[">=U; ["
1.3.3;F;;;@>;"utilrbo;	
;
U;[[[">=U; ["
2.0.4;F;:development;@H;"rubyforgeo;	
;
U;[[[">=U; ["
2.6.1;F;;;@R;"hoe"autobuild["sylvain.joyeux@m4x.org["Sylvain Joyeux"This work is licensed under the GPLv2 license. See License.txt for details

== What's autobuild ?
Autobuild imports, configures, builds and installs various kinds of software packages.
It can be used in software development to make sure that nothing is broken in the 
build process of a set of packages, or can be used as an automated installation tool.

Autobuild config files are Ruby scripts which configure rake to
* imports the package from a SCM or (optionnaly) updates it
* configures it. This phase can handle code generation, configuration (for
  instance for autotools-based packages), ...
* build
* install

It takes the dependencies between packages into account in its build process,
updates the needed environment variables (+PKG_CONFIG_PATH+, +PATH+,
+LD_LIBRARY_PATH+, ...)"'http://github.com/doudou/autobuildT@[ 