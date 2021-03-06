u:Gem::Specification�["
0.9.4i"pdf-storycardsU:Gem::Version["
0.1.0Iu:	TimeE�    :@marshal_with_utc_coercionF"VUtilities for generating printable story cards for agile planning and measurementU:Gem::Requirement[[[">U; ["
0.0.00"	ruby[o:Gem::Dependency:@version_requirement0:
@name"pdf-writer:@version_requirementsU;[[[">=U; ["
1.1.7o;	;
0;"
rspec;U;[[[">=U; ["
1.1.1o;	;
0;"hoe;U;[[[">=U; ["
1.5.0"pdf-storycards"luke@lukemelia.com["Luke Melia"�== DESCRIPTION:  Provides a script and library to parse stories saved in the RSpec plain text story format and creates a PDF file with printable 3&quot;x5&quot; index cards suitable for using in Agile planning and prioritization.  == FEATURES/PROBLEMS:  * Create a PDF with each page as a 3x5 sheet, or as 4 cards per 8.5 x 11 sheet * Included script reads stories from STDIN and writes PDF to STDOUT * TODO: Improve test coverage * TODO: Improve documentation  == SYNOPSIS:  From the command line with stories2cards &lt; /path/to/stories.txt  Or via Ruby story_text = File.read('my_story') pdf_content = PDF::Storycards::Writer.make_pdf(story_text, :style =&gt; :card_1up)  == REQUIREMENTS:"2http://rubyforge.org/projects/pdf-storycards/T@0