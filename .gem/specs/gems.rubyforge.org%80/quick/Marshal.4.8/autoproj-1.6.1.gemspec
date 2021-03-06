u:Gem::Specificationo["
1.3.7i"autoprojU:Gem::Version["
1.6.1u:	Time6��    ":Easy installation and management of robotics softwareU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
1.5.9:
@name"autobuild:@requirement@ :@prereleaseF:
@type:runtimeo;
;	U;[[[">=U; ["
1.0.0;
"
rmail;@*;F;;o;
;	U;[[[">=U; ["
1.3.3;
"utilrb;@4;F;;o;
;	U;[[[">=U; ["
1.3.3;
"nokogiri;@>;F;;o;
;	U;[[[">=U; ["
1.5.0;
"highline;@H;F;;o;
;	U;[[[">=U; ["
2.0.4;
"rubyforge;@R;F;:developmento;
;	U;[[[">=U; ["
0.5.9;
"webgen;@\;F;;o;
;	U;[[[">=U; ["
2.4.0;
"	rdoc;@f;F;;o;
;	U;[[[">=U; ["
2.6.1;
"hoe;@p;F;;"autobuild["sylvain.joyeux@dfki.de["Sylvain Joyeux"%What is Autoproj
----------------
Autoproj allows to easily install and maintain software that is under source
code form (usually from a version control system). It has been designed to support a
package-oriented development process, where each package can have its own
version control repository (think "distributed version control"). It also
provides an easy integration of the local operating system (Debian, Ubuntu,
Fedora, maybe MacOSX at some point).

This tool has been developped in the frame of the RubyInMotion project
(http://sites.google.com/site/rubyinmotion), to install robotics-related
software -- that is often bleeding edge. Unlike [the ROS build
system](http://ros.org), it is not bound to one build system, one VCS and one
integration framework. The philosophy behind autoproj
is:
 * supports both CMake and autotools, and can be adapted to other tools
 * supports different VCS: cvs, svn, git, plain tarballs.
 * software packages are plain packages, meaning that they can be built and
   installed /outside/ an autoproj tree, and are not tied *at all* to the
   autoproj build system.
 * leverage the actual OS package management system. Right now, only Debian-like
   systems (like Ubuntu) are supported, simply because it is the only one I have
   access to.
 * handle code generation properly"&http://doudou.github.com/autoprojT@[ 