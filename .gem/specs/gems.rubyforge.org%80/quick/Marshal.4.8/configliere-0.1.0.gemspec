u:Gem::Specification�["
1.3.7i"configliereU:Gem::Version["
0.1.0u:	TimeE��    ",Wise, discreet configuration managementU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
1.2.9:
@name"
rspec:@requirement@ :@prereleaseF:
@type:developmento;
;	U;[[[">=U; ["0;
"	yard;@*;F;;0"flip@infochimps.org["mrflip"� You've got a script. It's got some settings. Some settings are for this module, some are for that module. Most of them don't change. Except on your laptop, where the paths are different.  Or when you're in production mode. Or when you're testing from the command line.

   "" So, Consigliere of mine, I think you should tell your Don what everyone knows. "" -- Don Corleone

Configliere manage settings from many sources: static constants, simple config files, environment variables, commandline options, straight ruby. You don't have to predefine anything, but you can ask configliere to type-convert, require, document or password-obscure any of its fields. Modules can define config settings independently of each other and the main program.
")http://github.com/mrflip/configliereT@[ 