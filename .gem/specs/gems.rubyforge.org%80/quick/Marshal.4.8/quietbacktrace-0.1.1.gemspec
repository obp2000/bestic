u:Gem::Specification�["
0.9.4i"quietbacktraceU:Gem::Version["
0.1.1Iu:	Time���    :@marshal_with_utc_coercionF"|quiet_backtrace suppresses the noise in your Test::Unit backtrace. It also provides hooks for you to add additional filters.U:Gem::Requirement[[[">U; ["
0.0.00"	ruby[o:Gem::Dependency:@version_requirement0:
@name"hoe:@version_requirementsU;[[[">=U; ["
1.3.0"quietbacktrace"dcroak@thoughtbot.com["Dan Croak"== Install  sudo gem install quietbacktrace  == Usage  Quiet Backtrace works by adding new attributes to Test::Unit::TestCase.  By default, their values are:  self.quiet_backtrace = true self.backtrace_silencers = [:test_unit, :gem_root, :e1] self.backtrace_filters = [:method_name]0T@0