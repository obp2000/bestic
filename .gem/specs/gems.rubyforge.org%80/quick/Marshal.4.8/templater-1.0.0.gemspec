u:Gem::Specification�["
1.3.5i"templaterU:Gem::Version["
1.0.0Iu:	Timev_�    :@marshal_with_utc_coercionF"dTemplater has the ability to both copy files from A to B and also to render templates using ERBU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[
o:Gem::Dependency	:@version_requirementsU;[[[">=U; ["
1.4.0:
@name"highline:
@type:runtime:@version_requirement0o;		;
U;[[[">=U; ["
1.1.2;"diff-lcs;;;0o;		;
U;[[[">=U; ["
0.9.5;"extlib;;;0o;		;
U;[[[">=U; ["
1.2.8;"
rspec;:development;0o;		;
U;[[[">=U; ["
2.3.3;"hoe;;;0"templater["jonas.nicklas@gmail.com["Jonas Nicklas"BTemplater has the ability to both copy files from A to B and also to render templates using ERB. Templater consists of four parts:

- Actions (File copying routines, templates generation and directories creation routines).
- Generators (set of rules).
- Manifolds (generator suites).
- The command line interface.

Hierarchy is pretty simple: manifold has one or many public and private generators. Public ones are supposed to be called
by end user. Generators have one or more action that specify what they do, where they take files, how they name resulting
files and so forth.")http://github.com/jnicklas/templaterT@[ 