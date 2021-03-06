u:Gem::Specification�["
1.3.7i"autobuildU:Gem::Version["1.5.19u:	Timev��    "PRake-based utility to build and install multiple packages with dependenciesU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
0.7.0:
@name"	rake:@requirement@ :@prereleaseF:
@type:runtimeo;
;	U;[[[">=U; ["1.0;
"
rmail;@*;F;;o;
;	U;[[[">=U; ["0.0;
"daemons;@4;F;;o;
;	U;[[[">=U; ["
1.3.3;
"utilrb;@>;F;;o;
;	U;[[[">=U; ["
2.0.4;
"rubyforge;@H;F;:developmento;
;	U;[[[">=U; ["
2.6.1;
"hoe;@R;F;;"autobuild["sylvain.joyeux@m4x.org["Sylvain Joyeux"This work is licensed under the GPLv2 license. See License.txt for details

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