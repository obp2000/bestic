u:Gem::Specification�["
0.9.0i"
drawrU:Gem::Version["
1.0.1Iu:	Time��    :@marshal_with_utc_coercionF"/== FEATURES/PROBLEMS:  * Needs more tests!U:Gem::Requirement[[[">U; ["
0.0.00"	ruby[o:Gem::Dependency:@version_requirement0:
@name"hoe:@version_requirementsU;[[[">=U; ["
1.2.1"seattlerb"aaronp@rubyforge.org["Aaron Patterson"== DESCRIPTION:  This is a ruby wrapper around Plotr with a similar API to Gruff.  You can create graphs with a similar interface to Gruff, but offload the rendering to the browser!  == FEATURES/PROBLEMS:  * Needs more tests!  == SYNOPSIS:  An example in rails.  Your controller:  class GraphController &lt; ApplicationController def index @drawr = Drawr::Pie.new @drawr.title = &quot;Twan&quot; @drawr.data(&quot;One&quot;, [1]) @drawr.data('Two', [2]) @drawr.data('Three', [2]) @drawr.data('Four', [10]) @drawr.data('Five', [6]) end end  Your view:  &lt;html&gt; &lt;head&gt; &lt;%= javascript_include_tag 'prototype' %&gt; &lt;%= javascript_include_tag 'excanvas' %&gt; &lt;%= javascript_include_tag 'Plotr' %&gt; &lt;/head&gt; &lt;body&gt; &lt;%= @drawr %&gt; &lt;/body&gt; &lt;/html&gt;"http://seattlerb.org/T@0