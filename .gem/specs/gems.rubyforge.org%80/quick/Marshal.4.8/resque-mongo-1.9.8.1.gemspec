u:Gem::Specification["
1.3.6i"resque-mongoU:Gem::Version["1.9.8.1u:	TimeU��    "6Resque-mongo is resque fork with a mongo backend.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[	o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
1.0.0:
@name"
mongo:@requirement@ :@prereleaseF:
@type:runtimeo;
;	U;[[["~>U; ["
0.1.2;
"
vegas;@*;F;;o;
;	U;[[[">=U; ["
0.9.2;
"sinatra;@4;F;;o;
;	U;[[[">=U; ["
1.1.0;
"	json;@>;F;;0"yatiohi@ideopolis.gr["Christos Trochalakis"�    Resque-mongo is a fork of resque that uses mongo as a queue backend.

    Resque is a Redis-backed Ruby library for creating background jobs,
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
"0http://github.com/ctrochalakis/resque-mongoT@[ 