u:Gem::Specification�["
1.3.5i"acts_as_serviceU:Gem::Version["
0.0.2Iu:	TimeH��    :@marshal_with_utc_coercionF"yMakes it very easy to create a service-like class that's easy to start and stop, taken from work at discovereads.comU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[ 0"percivalatumamibuddotcom["Brian Percival"pA gem with a mixin to let you turn a class into something that runs like a service,
which you can MyService.start, MyService.stop, and MyService.restart. It tracks
its own pid. For now, pretty sure it requires that the class is running inside
a rails context (e.g. run by script/runner MyService.start), but that could
probably be changed without too much difficulty.
".http://github.com/bmpercy/acts_as_serviceT@[ 