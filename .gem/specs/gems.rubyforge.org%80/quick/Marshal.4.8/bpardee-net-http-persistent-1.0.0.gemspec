u:Gem::Specification-
["
1.3.6i" bpardee-net-http-persistentU:Gem::Version["
1.0.0u:	TimeD��    "zThis is an experimental branch that implements a connection pool of  Net::HTTP objects instead of a connection/threadU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["1.0:
@name"gene_pool:@requirement@ :@prereleaseF:
@type:runtimeo;
;	U;[[[">=U; ["
2.0.4;
"rubyforge;@*;F;:developmento;
;	U;[[[">=U; ["
2.6.2;
"hoe;@4;F;;" bpardee-net-http-persistent["drbrain@segment7.net["Eric Hodel"�This is an experimental branch that implements a connection pool of 
Net::HTTP objects instead of a connection/thread.  C/T is fine if
you're only using your http threads to make connections but if you 
use them in child threads then I suspect you will have a thread memory
leak.  Also, I want to see if I get less connection resets if the
most recently used connection is always returned.

Also added a :force_retry option that if set to true will retry POST
requests as well as idempotent requests.

This branch is currently incompatible with the master branch in the 
following ways:

* It doesn't allow you to recreate the Net::HTTP::Persistent object
  on the fly.  This is possible in the master version since all the 
  data is kept in thread local storage.  For this version, you should
  probably create a class instance of the object and use that in your
  instance methods.

* It uses a hash in the initialize method.  This was easier for me
  as I use a HashWithIndifferentAccess created from a YAML file to 
  define my options.  This should probably be modified to check the
  arguments to achieve backwards compatibility.

* The method shutdown is unimplemented as I wasn't sure how I should
  implement it and I don't need it as I do a graceful shutdown from 
  nginx to finish up my connections.

For connection issues, I completely recreate a new Net::HTTP instance.
I was running into an issue which I suspect is a JRuby bug where an
SSL connection that times out would leave the ssl context in a frozen
state which would then make that connection unusable so each time that
thread handled a connection a 500 error with the exception "TypeError:
can't modify frozen".  I think Joseph West's fork resolves this issue
but I'm paranoid so I recreate the object.

Compatibility with the master version could probably be achieved by
creating a Strategy wrapper class for GenePool and a separate strategy
class with the connection/thread implementation."7http://seattlerb.rubyforge.org/net-http-persistentT@[ 