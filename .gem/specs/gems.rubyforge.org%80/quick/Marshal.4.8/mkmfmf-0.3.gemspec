u:Gem::Specification�["
1.3.7i"mkmfmfU:Gem::Version["0.3u:	Time$��    "@Fork of bundled mkmf.rb, should work as drop in replacementU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
2.0.4:
@name"rubyforge:@requirement@ :@prereleaseF:
@type:developmento;
;	U;[[[">=U; ["
2.6.1;
"hoe;@*;F;;"
asher["asher@ridiculouspower.com["
Asher"�Fork of bundled mkmf.rb, should work as drop in replacement.

Modifications: 

* GDB and XCode path compatibility: relative path specified by mkmf 
	(../../../../ext/&lt;target&gt;/...) confuses source-to-debug correspondence.
	The downside to this is that mkmfmf specifies absolute paths, which
	means that the project will have to be recompiled for debugging from an
	alternate location. This can be disabled by adding a use_relative_paths block.

* CURRENTLY NOT WORKING: Sub-directory support for source code: all .c, .m, .cc, .cxx., .cpp files and 
	if the filesystem is case sensitive, all .C files are automatically included,
	and any directories with .h files are added to INCFLAGS. 
	
* Automatically uses CC from ENV if set"$http://rubygems.org/gems/mkmfmfT@[ 