u:Gem::Specification�["
1.3.6i"resque-lock-timeoutU:Gem::Version["
0.2.1Iu:	TimeW��    :@marshal_with_utc_coercionF"\A Resque plugin adding locking, with optional timeout/deadlock handling to resque jobs.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
1.8.0:
@type:runtime:@requirement@ :@prereleaseF:
@name"resqueo;	
;
U;[[[">=U; ["0;:development;@*;F;"	turno;	
;
U;[[[">=U; ["0;;;@4;F;"	yard0"luke@lividpenguin.com["Luke Antins"Ryan Carver"Chris Wanstrath"P  A Resque plugin. Adds locking, with optional timeout/deadlock handling to
  resque jobs.

  Using a `lock_timeout` allows you to re-aquire the lock should your worker
  fail, crash, or is otherwise unable to relase the lock.
  
  i.e. Your server unexpectedly looses power. Very handy for jobs that are
  recurring or may be retried.
"2http://github.com/lantins/resque-lock-timeoutF@[ 