u:Gem::Specification�["
1.3.6i"simple_publisherU:Gem::Version["
0.1.1Iu:	TimeV��    :@marshal_with_utc_coercionF"TDefines a simple pub/sub layer for interaction with the Starling message queue.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["0:@prereleaseF:
@type:runtime:@requirement@ :
@name"starlingo;	
;
U;[[[">=U; ["0;F;;;@*;"system_timero;	
;
U;[[[">=U; ["
1.2.9;F;:development;@4;"
rspec0"dirk@galaxycats.com["Dirk Breuer"hMore often than not you don't need a full fledged message queue like ActiveMQ
or RabbitMQ with a full size message format. For simple asynchronous distribution
tasks a very light weight persistent message queue like starling will be fine.
Nevertheless you want a more sophisticated interface to interact with than a
memcache interface. Simple Publisher tries to achieve exactly this: While using
Starling as the queuing system in the background we provide a messaging terminology 
well know and understood. The terminology is strongly inspired by JMS which is
kind a defacto standard for messaging on the API-level.
"2http://github.com/galaxycats/simple_publisherT@[ 