u:Gem::Specification{["
0.9.4i"hash_set_operatorsU:Gem::Version["
0.1.0Iu:	Time��    :@marshal_with_utc_coercionF"!Adds set operators to hashesU:Gem::Requirement[[[">U; ["
0.0.00"	ruby[o:Gem::Dependency:@version_requirement0:
@name"hoe:@version_requirementsU;[[[">=U; ["
1.5.1"rubysideshow"mikelovesrobots@gmail.com["Mike Judge"== DESCRIPTION:  * Adds +, -, and &amp; methods to Hashes  == SYNOPSIS:  require 'rubygems' require 'hash_set_operators'  {:controller =&gt; :user, :action =&gt; :edit} + {:action =&gt; :show, :id =&gt; 1} # =&gt; {:controller =&gt; :user, :action =&gt; :show, :id =&gt; 1}  {:controller =&gt; :user, :action =&gt; :edit} - {:action =&gt; :show, :id =&gt; 1} # =&gt; {:controller =&gt; :user}  {:controller =&gt; :user, :action =&gt; :edit} &amp; {:action =&gt; :show, :id =&gt; 1} # =&gt; {:action =&gt; :edit}  == INSTALL:"    by Mike JudgeT@0