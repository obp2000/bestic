u:Gem::Specification�["
1.3.7i"autotest-inotifyU:Gem::Version["
0.0.4u:	Timef��    "QTeaches autotest to use libinotify (on Linux) instead of filesystem polling.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
4.2.4:
@name"autotest:@requirement@ :@prereleaseF:
@type:runtimeo;
;	U;[[[">=U; ["0;
"rb-inotify;@*;F;;0"ericw@kill-0.com["Eric Wollesen"�Autotest relies on filesystem polling to detect modifications in source code files. This is expensive for the CPU, harddrive and battery - and unnecesary on Linux with libinotify installed. This gem teaches autotest how to use libinotify."0http://kill-0.com/projects/autotest-inotifyT@[ 