u:Gem::SpecificationA["
1.3.5i"rspec-cleverbacktraceU:Gem::Version["0.1Iu:	Time��    :@marshal_with_utc_coercionF"4A backtrace tweaker too clever for its own goodU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:runtime:@version_requirement0:
@name"
rspec:@version_requirementsU;[[[">=U; ["
1.2.9"cleverbacktrace"nyarly@gmail.com["Judson Lester"�  The default backtrace handling for rspec is ... okay.  It would be nice if
  you could find the source of exceptions during test runs without having
  to see *all* the backtraces, right?

  That's what this thing is for: it compacts backtraces, skims out things that
  should be ignored (and respects ignore_patterns), then trims filenames and 
  contracts repetition into a legible format.
"*http://cleverbacktrace.rubyforge.org/T@[ 