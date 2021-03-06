u:Gem::Specification["
1.3.2i"	mallU:Gem::Version["
0.0.1Iu:	Time'U�    :@marshal_with_utc_coercionF"MThis library provides access to the mallinfo(3) and mallopt(3) functionsU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:development:@version_requirement0:
@name"hoe:@version_requirementsU;[[[">=U; ["1.12.2"qrp["normalperson@yhbt.net["Eric Wong"_This library provides access to the mallinfo(3) and mallopt(3)
functions.  mallinfo(3) is used for reporting malloc statistics and
mallopt(3) can be used to tune malloc(3) implementations.  See the
corresponding documentation for the C library functions before
proceeding.

These functions are implementation-specific, so tuning options that
work for one implementation of malloc may not work at all for another
implementation.

Constants defined in the the malloc.h header with a &quot;M_&quot; prefix are
defined without the prefix in the Mall namespace (e.g.
M_TRIM_THRESHOLD =&gt; Mall::TRIM_THRESHOLD)."http://bogomips.org/mallT@[ 