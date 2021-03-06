u:Gem::Specification�["
1.3.7i"history_commanderU:Gem::Version["
0.0.3u:	TimeG��    "(Take command of your shell history!U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["0:
@name"eventmachine:@requirement@ :@prereleaseF:
@type:runtimeo;
;	U;[[[">=U; ["0;
"eventmachine-tail;@*;F;;o;
;	U;[[[">=U; ["0;
"	amqp;@4;F;;o;
;	U;[[[">=U; ["0;
"	json;@>;F;;o;
;	U;[[[">=U; ["0;
"simple-daemon;@H;F;;o;
;	U;[[[">=U; ["0;
"trollop;@R;F;;o;
;	U;[[[">=U; ["0;
"highline;@\;F;;o;
;	U;[[[">=U; ["0;
"	mash;@f;F;;o;
;	U;[[[">=U; ["
1.2.9;
"
rspec;@p;F;:development0"jeremy@rubyonlinux.org["Jeremy Deininger"Z History Commander is a ruby daemon that provides bash users with a global shared command line history.  All commands that history commander collects will be sent to all nodes for use with reverse history search in all bash shells.  It can also be used in monitor only mode (writeonly) where the bash history is only collected, not synchronized. "0http://github.com/jeremyd/history_commanderT@[ 