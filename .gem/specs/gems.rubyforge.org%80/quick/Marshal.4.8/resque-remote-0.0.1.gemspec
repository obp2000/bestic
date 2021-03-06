u:Gem::Specification^["
1.3.7i"resque-remoteU:Gem::Version["
0.0.1u:	Time&��    "3Resque plugin to allow remote job droppabilityU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["
1.3.6"	ruby[o:Gem::Dependency
:@version_requirementsU;[[["=U; ["1.0.0.rc.6:
@name"bundler:@requirement@ :@prereleaseF:
@type:developmento;
;	U;[[["=U; ["2.0.0.beta.20;
"
rspec;@*;F;;o;
;	U;[[["=U; ["1.10.0;
"resque;@4;F;;o;
;	U;[[[">=U; ["0;
"
redis;@>;F;;o;
;	U;[[[">=U; ["0;
"redis-namespace;@H;F;;o;
;	U;[[[">=U; ["0;
"yajl-ruby;@R;F;;"resque-remote["bj.neilsen@gmail.com["BJ Neilsen"�
Resque is great. So is job processing with redis. Our biggest drawback has been that
resque requires the class that will be processing a job to be loaded when the job 
is enqueued. But what happens when the implementing job is defined in a separate application
and isn't currently loaded into memory?

Enter Resque Remote.

Resque Remote's simple goal is to allow you to add a job to a queue with a string
identifier for the class rather than the class constant. It is assumed that the worker-side of
the equation _will_ have the class in memory and hence will be able to run it no problem.

Feedback, comments and questions are welcome at bj [dot] neilsen [at] gmail [dot] com.
"/http://github.com/localshred/resque-remoteT@[ 