u:Gem::Specificationl["
1.2.0i"pdf-labelsU:Gem::Version["
2.0.1Iu:	Time��    :@marshal_with_utc_coercionF"�Easy label creation in Ruby through PDF::Writer and using templates from gLabels. Contains the library pdf_labels, the Rails engine LabelPageEngine and an example application FileClerk.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:development:@version_requirement0:
@name"hoe:@version_requirementsU;[[[">=U; ["
1.7.0"pdf-labels"rgkaufman@gmail.com["Rob Kaufman"[== DESCRIPTION:  Welcome to the PDF-Labels project.  Our aim is to make creating labels programmatically easy in Ruby.  This Library builds on top of &quot;PDF::Writer&quot;:http://ruby-pdf.rubyforge.org/ and uses the templates from &quot;gLabels&quot;:http://glabels.sourceforge.org.  What this means is easy, clean Ruby code to create many common label types without measuring the labels yourself!  All of this in pure Ruby (we use the XML templates from gLabels, we do NOT have a dependancy on gLabels, nor on Gnome)  == FEATURES/PROBLEMS:  * Works with all gLabels supported templates for rectangular labels * Does not yet work for CD labels (circles)  == SYNOPSIS:  p = PDFLabelPage.new(&quot;Avery  8160&quot;) # label is 2 x 10 #Some examples of adding labels p.add_label() # should add to col 1, row 1 p.add_label(:position =&gt; 1) # should add col 1, row 2 p.add_label(:text =&gt; &quot;Positoin 15&quot;, :position =&gt; 15) # should add col 2, row 1 p.add_label(:text =&gt; 'No Margin', :position =&gt; 5, :use_margin =&gt; false) #this doesn't use a margin p.add_label(:position =&gt; 9, :text =&gt; &quot;X Offset = 4, Y Offset = -6&quot;, :offset_x =&gt; 4, :offset_y =&gt; -6) p.add_label(:text =&gt; &quot;Centered&quot;, :position =&gt; 26, :justification =&gt; :center) # should add col 2, row 15 p.add_label(:text =&gt; &quot;[Right justified]&quot;, :justification =&gt; :right, :position =&gt; 28)# col 2, row 14, right justified. p.add_label(:position =&gt; 29) # should add col 2, row 15 p.add_label(:position =&gt; 8, :text =&gt; &quot;This was added last and has a BIG font&quot;, :font_size =&gt; 18)0T@0