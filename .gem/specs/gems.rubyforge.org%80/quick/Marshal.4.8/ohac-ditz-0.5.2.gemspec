u:Gem::Specification�["
1.3.5i"ohac-ditzU:Gem::Version["
0.5.2Iu:	Time��    :@marshal_with_utc_coercionT"�A simple issue tracker designed to integrate well with distributed version control systems like git and darcs. State is saved to a YAML file kept under version control, allowing issues to be closed/added/modified as part of a commit.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:runtime:@version_requirement0:
@name"trollop:@version_requirementsU;[[[">=U; ["1.9o;		;
;;0;"yaml_waml;U;[[[">=U; ["0.3"	ditz"ohachige@gmail.com["OHASHI Hideya"#Ditz is a simple, light-weight distributed issue tracker designed to work with
distributed version control systems like git, darcs, Mercurial, and Bazaar. It
can also be used with centralized systems like SVN.

Ditz maintains an issue database directory on disk, with files written in a
line-based and human-editable format. This directory can be kept under version
control, alongside project code.

Ditz provides a simple, console-based interface for creating and updating the
issue database files, and some basic static HTML generation capabilities for
producing world-readable status pages (for a demo, see the ditz ditz page).

Ditz includes a robust plugin system for adding commands, model fields, and
modifying output. See PLUGINS.txt for documentation on the pre-shipped plugins.

Ditz currently offers no central public method of bug submission. 

== USING DITZ

There are several different ways to use Ditz:

1. Treat issue change the same as code change: include it as part of commits,
   and merge it with changes from other developers, resolving conflicts in the
   usual manner.
2. Keep the issue database in the repository but in a separate branch. Issue
   changes can be managed by your VCS, but is not tied directly to code
   commits.
3. Keep the issue database separate and not under VCS at all."http://ditz.rubyforge.orgT@[ 