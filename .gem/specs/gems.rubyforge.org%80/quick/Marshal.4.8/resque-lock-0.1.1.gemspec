u:Gem::SpecificationJ["
1.3.5i"resque-lockU:Gem::Version["
0.1.1Iu:	Time'��    :@marshal_with_utc_coercionF"UA Resque plugin for ensuring only one instance of your job is running at a time.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[ 0"chris@ozmm.org["Chris Wanstrath"A Resque plugin. If you want only one instance of your job
running at a time, extend it with this module.

For example:

    class UpdateNetworkGraph
      extend Resque::Jobs::Locked

      def self.perform(repo_id)
        heavy_lifting
      end
    end
"*http://github.com/defunkt/resque-lockT@[ 