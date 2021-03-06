u:Gem::SpecificationC["
1.3.6i"resque-fairlyU:Gem::Version["
1.0.1u:	Time��    "%Fair queue processing for ResqueU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[["~>U; ["1.0:
@name"resque:@requirement@ :@prereleaseF:
@type:runtimeo;
;	U;[[[">=U; ["
1.2.9;
"
rspec;@*;F;:development0"pezra@barelyenough.org["Peter Williams"�Normally resque processes queues in a fixed order.  This can lead to jobs in queues at the end of the list not getting process for very long periods.  resque-fairly provides a mechanism where by workers are distributed across the set of queues with pending jobs fairly.  This results in a much more predictable mean time to handling for jobs in queues that are not the first in the list.
"*http://github.com/pezra/resque-fairlyT@[ 