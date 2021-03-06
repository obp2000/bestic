u:Gem::Specification�["
1.3.6i"resque-lonerU:Gem::Version["
0.1.1Iu:	Time���    :@marshal_with_utc_coercionF"Adds unique jobs to resqueU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["
1.3.5"	ruby[o:Gem::Dependency
:@requirementU;[[[">=U; ["0:@version_requirements@ :@prereleaseF:
@type:development:
@name"
rspec"resque-loner["jannis@moviepilot.com["Jannis Hermanns"!Makes sure that for special jobs, there can be only one job with the same workload in one queue.

Example:
    class CacheSweeper &lt; Resque::Plugins::Loner::UniqueJob
       @queue = :cache_sweeps

       def self.perform(article_id)
         # Cache Me If You Can...
       end
    end
"*http://github.com/jayniz/resque-lonerT@[ 