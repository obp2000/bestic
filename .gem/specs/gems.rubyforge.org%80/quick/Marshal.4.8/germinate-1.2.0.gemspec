u:Gem::SpecificationR["
1.3.1i"germinateU:Gem::Version["
1.2.0Iu:	Time�Z�    :@marshal_with_utc_coercionF"/Germinate is a tool for writing about codeU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:runtime:
@name"ick:@version_requirementsU;[[["~>U; ["
0.3.0:@version_requirement0o;		;
;;"
fattr;U;[[["~>U; ["
1.0.3;0o;		;
;;"arrayfields;U;[[["~>U; ["
4.7.3;0o;		;
;;"orderedhash;U;[[["~>U; ["
0.0.6;0o;		;
;;"alter-ego;U;[[["~>U; ["
1.0.0;0o;		;
;;"	main;U;[[["~>U; ["
2.8.3;0o;		;
:development;"
bones;U;[[[">=U; ["
2.5.1;0"germinate"avdi@avdi.org["Avdi Grimm"�Germinate is a tool for writing about code.  With Germinate, the source code IS the article.  For example, given the following source code:  # #!/usr/bin/env ruby # :BRACKET_CODE: &lt;pre&gt;, &lt;/pre&gt; # :PROCESS: ruby, &quot;ruby %f&quot;  # :SAMPLE: hello def hello(who) puts &quot;Hello, #{who}&quot; end  hello(&quot;World&quot;)  # :TEXT: # Check out my amazing program!  Here's the hello method: # :INSERT: @hello:/def/../end/  # And here's the output: # :INSERT: @hello|ruby  When we run the &lt;tt&gt;germ format&lt;/tt&gt; command the following output is generated:  Check out my amazing program!  Here's the hello method: &lt;pre&gt; def hello(who) puts &quot;Hello, #{who}&quot; end &lt;/pre&gt; And here's the output: &lt;pre&gt; Hello, World &lt;/pre&gt;  To get a better idea of how this works, please take a look at link:examples/basic.rb, or run:  germ generate &gt; basic.rb  To generate an example article to play with.  Germinate is particularly useful for writing articles, such as blog posts, which contain code excerpts.  Instead of forcing you to keep a source code file and an article document in sync throughout the editing process, the Germinate motto is &quot;The source code IS the article&quot;.  Specially marked comment sections in your code file become the article text.  Wherever you need to reference the source code in the article, use insertion directives to tell Germinate what parts of the code to excerpt.  An advanced selector syntax enables you to be very specific about which lines of code you want to insert.  If you also want to show the output of your code, Germinate has you covered. Special &quot;process&quot; directives enable you to define arbitrary commands which can be run on your code.  The output of the command then becomes the excerpt text. You can define an arbitrary number of processes and have different excerpts showing the same code as processed by different commands.  You can even string processes together into pipelines.  Development of Germinate is graciously sponsored by Devver, purveyor of fine cloud-based services to busy Ruby developers.  If you like this tool please check them out at http://devver.net."(http://github.com/devver/germinate/T@0