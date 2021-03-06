u:Gem::Specification-["
1.3.5i"zenprofileU:Gem::Version["
1.2.0Iu:	Time�]�    :@marshal_with_utc_coercionF";zenprofiler helps answer WHAT is being called the mostU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:@version_requirementsU;[[[">=U; ["0:
@name"ZenTest:
@type:runtime:@version_requirement0o;		;
U;[[[">=U; ["0;"event_hook;;;0o;		;
U;[[[">=U; ["
2.3.3;"hoe;:development;0"seattlerb["ryand-ruby@zenspider.com["Ryan Davis"zenprofiler helps answer WHAT is being called the most. spy_on helps
answer WHERE those calls are being made. ZenProfiler provides a faster
version of the standard library ruby profiler. It is otherwise pretty
much the same as before. spy_on provides a clean way to redefine a
bottleneck method so you can account for and aggregate all the calls
to it.

    % ruby -Ilib bin/zenprofile misc/factorial.rb 50000
    Total time = 3.056884
    Total time = 2.390000

              total     self              self    total
    % time  seconds  seconds    calls  ms/call  ms/call  name
     50.70     1.64     1.64    50000     0.03     0.05 Integer#downto
     19.63     2.27     0.63   200000     0.00     0.00 Fixnum#*
     14.19     2.73     0.46    50000     0.01     0.05 Factorial#factorial
      9.93     3.05     0.32        1   320.36  3047.10 Range#each
      5.54     3.23     0.18        2    89.40   178.79 ZenProfiler#start_hook

Once you know that Integer#downto takes 50% of the entire run, you
can use spy_on to find it. (See misc/factorial.rb for the actual code):

    % SPY=1 ruby -Ilib misc/factorial.rb 50000
    Spying on Integer#downto

    Integer.downto

    50000: total
    50000: ./misc/factorial.rb:6:in `factorial' via 
           ./misc/factorial.rb:6:in `factorial'",http://rubyforge.org/projects/seattlerbT@[ 