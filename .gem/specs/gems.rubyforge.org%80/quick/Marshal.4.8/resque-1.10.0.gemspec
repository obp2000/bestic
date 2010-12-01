u:Gem::Specification�["
1.3.6i"resqueU:Gem::Version["1.10.0u:	Time��    ".Resque is a Redis-backed queueing system.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[	o:Gem::Dependency
:@version_requirementsU;[[["~>U; ["
0.8.0:
@name"redis-namespace:@requirement@ :@prereleaseF:
@type:runtimeo;
;	U;[[["~>U; ["
0.1.2;
"
vegas;@*;F;;o;
;	U;[[[">=U; ["
0.9.2;
"sinatra;@4;F;;o;
;	U;[[["~>U; ["
1.4.6;
"	json;@>;F;;0"chris@ozmm.org["Chris Wanstrath"�    Resque is a Redis-backed Ruby library for creating background jobs,
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
"%http://github.com/defunkt/resqueT@[ 