u:Gem::Specificationc["
1.3.6i" spatialnetworks-pdf-stamperU:Gem::Version["
0.3.0u:	Timed��    "7Super cool PDF templates using iText's PdfStamper.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
1.2.3:
@name"newgem:@requirement@ :@prereleaseF:
@type:developmento;
;	U;[[[">=U; ["
1.8.0;
"hoe;@*;F;;"pdf-stamper"joe@spatialnetworks.com["Joe Steele"ySuper cool PDF templates using iText's PdfStamper.  == CAVEAT:  Anything super cool must have a caveat. You have to use JRuby or RJB. Plus you can only use Adobe LiveCycle Designer to create the templates.  == EXAMPLE: pdf = PDF::Stamper.new("my_template.pdf") pdf.text :first_name, "Jason" pdf.text :last_name, "Yates" pdf.image :photo, "photo.jpg" pdf.save_as "my_output.pdf""3http://github.com/spatialnetworks/pdf-stamper/T@[ 