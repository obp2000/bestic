u:Gem::Specification�["
0.9.4i"technoratiU:Gem::Version["
0.0.1Iu:	Time���    :@marshal_with_utc_coercionF"1A very simple wrapper for the Technorati APIU:Gem::Requirement[[[">U; ["
0.0.00"	ruby[o:Gem::Dependency:@version_requirement0:
@name"hoe:@version_requirementsU;[[[">=U; ["
1.3.0"technorati"$brian.leroux@westcoastlogic.com["Brian LeRoux"[== FEATURES/PROBLEMS:  * make any call to the technorati api and recieves the raw XML response * TODO: use XML Simple to return pure Ruby structures * TODO: add options hash for additional edge cases * TODO: better testing  == SYNOPSIS:  t = Technorati.new( 'your api key' )  puts t.member_info( 'brianleroux' ) puts t.info( 'westcoastlogic.com' )"    by Brian LeRouxT@0