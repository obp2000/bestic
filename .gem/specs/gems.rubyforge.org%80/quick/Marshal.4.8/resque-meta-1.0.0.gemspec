u:Gem::Specification@["
1.3.7i"resque-metaU:Gem::Version["
1.0.0Iu:	Time���    :@marshal_with_utc_coercionF".A Resque plugin for storing job metadata.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
1.8.0:@prereleaseF:
@type:runtime:@requirement@ :
@name"resque0"lee.marlow@gmail.com["Lee Marlow"�A Resque plugin.  If you want to be able to add metadata for a job
to track anything you want, extend it with this module.

For example:

    class MyJob
      extend Resque::Jobs::Meta

      def self.perform(meta_id, *args)
        heavy_lifting
      end
    end

    meta0 = MyJob.enqueue('stuff')
    meta0.enqueued_at # =&gt; 'Wed May 19 13:42:41 -0600 2010'
    meta0.meta_id # =&gt; '03c9e1a045ad012dd20500264a19273c'
    meta0['foo'] = 'bar' # =&gt; 'bar'

    # later
    meta1 = MyJob.get_meta('03c9e1a045ad012dd20500264a19273c')
    meta1.job_class # =&gt; MyJob
    meta1.enqueued_at # =&gt; 'Wed May 19 13:42:41 -0600 2010'
    meta1['foo'] # =&gt; 'bar'
"*http://github.com/lmarlow/resque-metaT@[ 