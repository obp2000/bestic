u:Gem::SpecificationO["
1.3.7i"resque-resultU:Gem::Version["
1.0.0Iu:	Time���    :@marshal_with_utc_coercionF"9A Resque plugin for retrieving a job's return value.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
1.9.0:@prereleaseF:
@type:runtime:@requirement@ :
@name"resqueo;	
;
U;[[[">=U; ["
1.0.0;F;;;@*;"resque-meta0"lee.marlow@gmail.com["Lee Marlow"dIf you want to be able fetch the result from a Resque
job's perform method.  Results will be encoded using JSON.

  For example:

      class MyJob
        extend Resque::Jobs::Result

        def self.perform(meta_id, big_num)
          factor(big_num)
        end
      end

      meta0 = MyJob.enqueue(3574406403731)
      meta0.enqueued_at # =&gt; 'Wed May 19 13:42:41 -0600 2010'
      meta0.meta_id # =&gt; '03c9e1a045ad012dd20500264a19273c'

      # later
      meta1 = MyJob.get_meta('03c9e1a045ad012dd20500264a19273c')
      meta1.succeeded? # =&gt; true
      meta1.result # =&gt; [ 1299709, 2750159 ]
",http://github.com/lmarlow/resque-resultT@[ 