u:Gem::Specification,["
0.9.4i"mailtrapU:Gem::Version["
0.2.1Iu:	Timew��    :@marshal_with_utc_coercionF"@Mailtrap is a mock SMTP server for use in Rails developmentU:Gem::Requirement[[[">U; ["
0.0.00"	ruby[o:Gem::Dependency:@version_requirement0:
@name"daemons:@version_requirementsU;[[[">=U; ["
1.0.8o;	;
0;"trollop;U;[[[">=U; ["1.7o;	;
0;"hoe;U;[[[">=U; ["
1.3.0"rubymatt"self@mattmower.com["Matt Mower"FMailtrap is a mock SMTP server for use in Rails development.  Mailtrap waits on your choosen port for a client to connect and talks _just enough_ SMTP protocol for ActionMailer to successfully deliver its message.  Mailtrap makes *no* attempt to actually deliver messages and, instead, writes them into a file (hence the name 	Mail_trap_). Handy tip: use tail -f to see emails being received.  You can configure the hostname (default: localhost) and port (default: 2525) for the server and also where the messages get written (default: /var/tmp/mailtrap.log).  == FEATURES/PROBLEMS:"+    by Matt Mower <self@mattmower.com>T@0