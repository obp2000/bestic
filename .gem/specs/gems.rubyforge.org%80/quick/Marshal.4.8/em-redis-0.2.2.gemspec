u:Gem::Specification�["
1.3.5i"em-redisU:Gem::Version["
0.2.2Iu:	Time�o�    :@marshal_with_utc_coercionF",An EventMachine[http://rubyeventmachineU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[	o:Gem::Dependency	:
@type:runtime:@version_requirement0:
@name"eventmachine:@version_requirementsU;[[[">=U; ["0.12.10o;		;
:development;0;"
bacon;U;[[[">=U; ["
1.1.0o;		;
;;0;"em-spec;U;[[[">=U; ["
0.2.0o;		;
;;0;"
bones;U;[[[">=U; ["
3.2.0"em-redis"libc@me.com["Jonathan Broad"Eugene Pimenov"�An EventMachine[http://rubyeventmachine.com/] based library for interacting with the very cool Redis[http://code.google.com/p/redis/] data store by Salvatore 'antirez' Sanfilippo.
Modeled after eventmachine's implementation of the memcached protocol, and influenced by Ezra Zygmuntowicz's {redis-rb}[http://github.com/ezmobius/redis-rb/tree/master] library (distributed as part of Redis).

This library is only useful when used as part of an application that relies on
Event Machine's event loop.  It implements an EM-based client protocol, which
leverages the non-blocking nature of the EM interface to achieve significant
parallelization without threads.0T@[ 