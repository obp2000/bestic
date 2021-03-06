u:Gem::Specification�["
1.3.6i"opengotham_resqueU:Gem::Version["
1.8.2Iu:	TimeĐ�    :@marshal_with_utc_coercionF".resque is a Redis-backed queueing system.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[	o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["2.0.0.rc2:
@type:runtime:@requirement@ :@prereleaseF:
@name"
rediso;	
;
U;[[[">=U; ["
0.4.4;;;@*;F;"opengotham_redis-namespaceo;	
;
U;[[[">=U; ["
0.1.2;;;@4;F;"
vegaso;	
;
U;[[[">=U; ["
0.9.2;;;@>;F;"sinatra0"mjording@opengotham.com["Matthew Jording"�    Resque is a Redis-backed Ruby library for creating background jobs,
    placing those jobs on multiple queues, and processing them later.

    Background jobs can be any Ruby class or module that responds to
    perform. Your existing classes can easily be converted to background
    jobs or you can create new classes specifically to do work. Or, you
    can do both.

    Resque is heavily inspired by DelayedJob (which rocks) and is
    comprised of three parts:

    * A Ruby library for creating, querying, and processing jobs
    * A Rake task for starting a worker which processes jobs
    * A Sinatra app for monitoring queues, jobs, and workers.
"(http://github.com/opengotham/resqueT@[ 