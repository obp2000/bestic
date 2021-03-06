u:Gem::Specification�["
1.3.7i"flamingoU:Gem::Version["
0.2.0u:	Time%��    "GFlamingo is an elegant way to wade into the Twitter Streaming API.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
1.0.7:
@name"
redis:@requirement@ :@prereleaseF:
@type:runtimeo;
;	U;[[[">=U; ["
0.7.0;
"redis-namespace;@*;F;;o;
;	U;[[[">=U; ["
1.9.7;
"resque;@4;F;;o;
;	U;[[[">=U; ["
0.9.2;
"sinatra;@>;F;;o;
;	U;[[[">=U; ["
0.1.4;
"twitter-stream;@H;F;;o;
;	U;[[[">=U; ["
0.6.7;
"yajl-ruby;@R;F;;o;
;	U;[[[">=U; ["
2.1.0;
"activesupport;@\;F;;o;
;	U;[[[">=U; ["
0.1.0;
"mockingbird;@f;F;:development0"hayes@appozite.com["Hayes Davis"Jerry Chen"J    Flamingo makes it easy to wade through the Twitter Streaming API by 
    handling all connectivity and resource management for you. You just tell 
    it what to track and consume the information in a resque queue. 

    Flamingo isn't a traditional ruby gem. You don't require it into your code.
    Instead, it's designed to run as a daemon like redis or mysql. It provides 
    a REST interface to change the parameters sent to the Twitter Streaming 
    resource. All events from the streaming API are placed on a resque job 
    queue where your application can process them.

"*http://github.com/hayesdavis/flamingoT@[ 