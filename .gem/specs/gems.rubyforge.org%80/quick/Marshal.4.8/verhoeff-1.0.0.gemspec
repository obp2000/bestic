u:Gem::SpecificationT["
0.9.2i"verhoeffU:Gem::Version["
1.0.0Iu:	Time���    :@marshal_with_utc_coercionF"BA pure-Ruby implementation of the Verhoeff checksum algorithmU:Gem::Requirement[[[">U; ["
0.0.00"	ruby[o:Gem::Dependency:@version_requirement0:
@name"hoe:@version_requirementsU;[[[">=U; ["
1.2.1"verhoeff"jay -at- codemecca.com["Jay Phillips"�== FEATURES/PROBLEMS:  A library that returns  == SYNOPSIS:  Verhoeff.checkum_of 12345 # =&gt; &quot;123451&quot; Verhoeff.checkum_of 54321 # =&gt; &quot;543217&quot; Verhoeff.checks_out? 543217 # =&gt; true Verhoeff.checks_out? 543211 # =&gt; false  Or, if you've required verhoeff/monkey_patches, you can do this:  656.checksum # =&gt; 6569 &quot;657&quot;.checksum # =&gt; 6576 6567.checks_out? # =&gt; true &quot;6560&quot;.checks_out? # =&gt; false"$    by Jay Phillips (your name)T@0