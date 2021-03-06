u:Gem::Specification�["
1.3.6i"resque-lonerU:Gem::Version["
0.1.2u:	TimeV��    "Adds unique jobs to resqueU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[["=U; ["
1.9.5:
@name"resque:@requirement@ :@prereleaseF:
@type:runtimeo;
;	U;[[[">=U; ["0;
"
rspec;@*;F;:development"resque-loner["jannis@moviepilot.com["Jannis Hermanns"!Makes sure that for special jobs, there can be only one job with the same workload in one queue.

Example:
    class CacheSweeper &lt; Resque::Plugins::Loner::UniqueJob
       @queue = :cache_sweeps

       def self.perform(article_id)
         # Cache Me If You Can...
       end
    end
"*http://github.com/jayniz/resque-lonerT@[ 