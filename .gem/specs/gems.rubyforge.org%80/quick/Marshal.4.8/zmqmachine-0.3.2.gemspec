u:Gem::Specification�["
1.3.6i"zmqmachineU:Gem::Version["
0.3.2u:	Time%��    "ZMQMachine is another Ruby implementation of the reactor pattern but this time using 0mq sockets rather than POSIX socketsU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
0.5.0:
@name"ffi-rzmq:@requirement@ :@prereleaseF:
@type:runtimeo;
;	U;[[[">=U; ["
3.4.7;
"
bones;@*;F;:development"zmqmachine"cremes@mac.com["Chuck Remes"�ZMQMachine is another Ruby implementation of the reactor pattern but this
time using 0mq sockets rather than POSIX sockets.

Unlike the great Eventmachine ruby project and the Python Twisted
project which work with POSIX sockets, ZMQMachine is inherently threaded. The
0mq sockets backing the reactor use a thread pool for performing
their work so already it is different from most other reactors. Also, a
single program may create multiple reactor instances which runs in
its own thread. All activity within the reactor is single-threaded
and asynchronous.

It is possible to extend the 0mq library to "poll" normal file
descriptors. This isn't on my roadmap but patches are accepted.",http://github.com/chuckremes/zmqmachineT@[ 