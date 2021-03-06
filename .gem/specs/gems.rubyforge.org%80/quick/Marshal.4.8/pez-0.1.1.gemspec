u:Gem::Specification�["
1.3.5i"pezU:Gem::Version["
0.1.1Iu:	Time#��    :@marshal_with_utc_coercionF"VManage Ruby on Rails plugins from GIT and Subversion repositories in a simple wayU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:@version_requirementsU;[[[">=U; ["0:
@type:runtime:@version_requirement0:
@name"	main0"fnando.vieira@gmail.com["Nando Vieira"�Pez is a simple tool to manage plugins from Git and Subversion repositories in
a easy way. Instead of adding plugins to the project repository, Pez
checkouts/clones the specified version to a temporary directory and
creates a symlink to the Ruby on Rails plugin directory.

When Pez is asked to update the plugins, it runs the correct command in that
directory, based on the repository type (Git or Subversion), which in turn is
applied to the project through the symlink.

Pez allows different environments to update plugins from a different directory.
So, when you deploy your Ruby on Rails application, you won't have to
checkout/update all plugins again, unless you explicit say so.

Pez is based on Braid (which I never had it working) but way simpler.
"!http://github.com/fnando/pezT@[ 