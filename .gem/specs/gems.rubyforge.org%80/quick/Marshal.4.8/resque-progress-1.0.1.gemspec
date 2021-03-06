u:Gem::Specification�["
1.3.7i"resque-progressU:Gem::Version["
1.0.1u:	Time$��    "2A Resque plugin for progress updates on jobs.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
1.8.0:
@name"resque:@requirement@ :@prereleaseF:
@type:runtimeo;
;	U;[[[">=U; ["
1.0.0;
"resque-meta;@*;F;;0"idris@umd.edu["Idris Mokhtarzada")A Resque plugin that provides helpers for progress updates from within your 
jobs.

For example:

    class MyJob
      extend Resque::Plugins::Progress

      def self.perform(meta_id, *args)
        (0..10).each do |i|
          at(i, 10, "Lifted #{num} heavy things. #{10-num} more to go!")
          heavy_lifting(i)
        end
      end
    end

    meta0 = MyJob.enqueue('stuff')
    meta0.progress.num_complete # =&gt; 0
    meta0.progress.total # =&gt; 10
    meta0.progress.percent # =&gt; 100
    meta0.progress.message # =&gt; nil

    # later
    meta1 = MyJob.get_meta('03c9e1a045ad012dd20500264a19273c')
    meta1.progress.num_complete # =&gt; 4
    meta1.progress.total # =&gt; 10
    meta1.progress.percent # =&gt; 40
    meta1.progress.message # =&gt; 'Lifted 4 heavy things. 6 more to go!'
",http://github.com/idris/resque-progressT@[ 