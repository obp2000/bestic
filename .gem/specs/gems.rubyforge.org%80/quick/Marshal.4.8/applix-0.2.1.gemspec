u:Gem::Specification'["
1.3.5i"applixU:Gem::Version["
0.2.1Iu:	Timek�    :@marshal_with_utc_coercionF":build typed option hashed from command line argumentsU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:development:@version_requirement0:
@name"
rspec:@version_requirementsU;[[[">=U; ["00"dirk@sebrink.de["dirk luesebrink"�      ApplixHash#from_argv builds hashes from ARGV like argument vectors
      according to following examples: 
      
         '-f'                  --&gt; { :f      =&gt; true }
         '--flag'              --&gt; { :flag   =&gt; true }
         '--flag:false'        --&gt; { :flag   =&gt; false }
         '--flag=false'        --&gt; { :flag   =&gt; 'false' }
         '--option=value'      --&gt; { :option =&gt; "value" }
         '--int=1'             --&gt; { :int    =&gt; "1" }
         '--float=2.3'         --&gt; { :float  =&gt; "2.3" }
         '--float:2.3'         --&gt; { :float  =&gt; 2.3 }
         '--txt="foo bar"'     --&gt; { :txt    =&gt; "foo bar" }
         '--txt:'"foo bar"'' --&gt; { :txt    =&gt; "foo bar" }
         '--txt:%w{foo bar}'   --&gt; { :txt    =&gt; ["foo", "bar"] }
         '--now:Time.now'      --&gt; { :now    =&gt; #&lt;Date: 3588595/2,0,2299161&gt; }
      
       remaining arguments(non flag/options) are inserted as [:arguments,
       args], eg:
           Hash.from_argv %w(--foo --bar=loo 123 now)
       becomes  
           { :foo =&gt; true, :bar =&gt; 'loo', :arguments =&gt; ["123", "now"] }
      
""http://github.com/crux/applixT@[ 