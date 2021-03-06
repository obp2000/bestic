u:Gem::Specification�["
1.3.1i"pdf-stamperU:Gem::Version["
0.3.0Iu:	TimeE�    :@marshal_with_utc_coercionF"7Super cool PDF templates using iText's PdfStamper.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:development:@version_requirement0:
@name"newgem:@version_requirementsU;[[[">=U; ["
1.2.3o;		;
;;0;"hoe;U;[[[">=U; ["
1.8.0"pdf-stamper"jaywhy@gmail.com["Jason Yates"�Super cool PDF templates using iText's PdfStamper.  == CAVEAT:  Anything super cool must have a caveat. You have to use JRuby or RJB. Plus you can only use Adobe LiveCycle Designer to create the templates.  == EXAMPLE: pdf = PDF::Stamper.new(&quot;my_template.pdf&quot;) pdf.text :first_name, &quot;Jason&quot; pdf.text :last_name, &quot;Yates&quot; pdf.image :photo, &quot;photo.jpg&quot; pdf.save_as &quot;my_output.pdf&quot;",  http://github.com/jaywhy/pdf-stamper/T@0