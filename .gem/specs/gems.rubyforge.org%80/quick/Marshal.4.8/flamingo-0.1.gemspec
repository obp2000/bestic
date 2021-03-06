u:Gem::Specification_["
1.3.7i"flamingoU:Gem::Version["0.1Iu:	Timee��    :@marshal_with_utc_coercionF"GFlamingo is an elegant way to wade into the Twitter Streaming API.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
1.0.7:@prereleaseF:
@type:runtime:@requirement@ :
@name"
rediso;	
;
U;[[[">=U; ["
0.7.0;F;;;@*;"redis-namespaceo;	
;
U;[[[">=U; ["
1.9.7;F;;;@4;"resqueo;	
;
U;[[[">=U; ["
0.9.2;F;;;@>;"sinatrao;	
;
U;[[[">=U; ["
0.1.4;F;;;@H;"twitter-streamo;	
;
U;[[[">=U; ["
0.6.7;F;;;@R;"yajl-rubyo;	
;
U;[[[">=U; ["
2.1.0;F;;;@\;"activesupport0"hayes@appozite.com["Hayes Davis"Jerry Chen"J    Flamingo makes it easy to wade through the Twitter Streaming API by 
    handling all connectivity and resource management for you. You just tell 
    it what to track and consume the information in a resque queue. 

    Flamingo isn't a traditional ruby gem. You don't require it into your code.
    Instead, it's designed to run as a daemon like redis or mysql. It provides 
    a REST interface to change the parameters sent to the Twitter Streaming 
    resource. All events from the streaming API are placed on a resque job 
    queue where your application can process them.

"*http://github.com/hayesdavis/flamingoT@[ 