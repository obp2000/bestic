u:Gem::Specification�["
1.2.0i"ubc-monitorU:Gem::Version["
1.1.0Iu:	Time-�    :@marshal_with_utc_coercionF"Iubc_monitor monitors resource usage in virtual servers run by OpenVzU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:development:@version_requirement0:
@name"newgem:@version_requirementsU;[[[">=U; ["
1.0.6o;		;
;;0;"hoe;U;[[[">=U; ["
1.8.0"ubc-monitor["christian@cjohansen.no["Christian Johansen"�ubc_monitor monitors resource usage in virtual servers run by OpenVz.  Monitor /proc/user_beancounters and send an email to the systems administrator if failcnt has increased since last time ubc_monitor was run.  ubc_monitor uses a file (by default ~/.ubc_monitor) to keep track of user_beancounter fail counts. When running without this file (such as the first run) any fail count except 0 will be reported."1http://www.cjohansen.no/projects/ubc_monitorT@0