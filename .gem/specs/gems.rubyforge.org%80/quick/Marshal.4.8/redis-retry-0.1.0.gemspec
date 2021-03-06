u:Gem::Specificationu["
1.3.6i"redis-retryU:Gem::Version["
0.1.0Iu:	Time��    :@marshal_with_utc_coercionF"!Auto-retries Redis commands.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["0:@requirement@ :
@type:runtime:@prereleaseF:
@name"
redis0"matt@mattduncan.org["Matt Duncan"�Adds a Redis::Retry class which can be used to proxy calls to Redis while
automatically retrying when a connection cannot be made.  This is useful
to ensure that your applications don't fail if Redis is temporarily
unavailable.
"+http://github.com/mrduncan/redis-retryT@[ 