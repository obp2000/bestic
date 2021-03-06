u:Gem::Specification�["
1.3.6i"naturalsortU:Gem::Version["
1.1.1Iu:	Time���    :@marshal_with_utc_coercionF"sNaturalSort is a small and simple library to implements a natural or human friendly alphabetical sort in ruby.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
2.0.4:
@type:development:@requirement@ :@prereleaseF:
@name"rubyforgeo;	
;
U;[[[">=U; ["
2.6.0;;;@*;F;"hoe"naturalsort"pub.cog@gmail.com["Benjamin Francisoud"�Examples: 
  ['a1', 'a11', 'a12', 'a2', 'a21']       =&gt; ['a1', 'a2', 'a11', 'a12','a21']
  ['a', 'b', 'c', 'A', 'B', 'C']          =&gt; ['A', 'a', 'B', 'b', 'C', 'c']
  ['x__2', 'x_1']                         =&gt; ['x_1', 'x__2']
  ['x2-y08', 'x2-g8', 'x2-y7', 'x8-y8']   =&gt; ['x2-g8', 'x2-y7', 'x2-y08', 'x8-y8']
* ['x02-y08', 'x02-g8', 'x2-y7', 'x8-y8'] =&gt; ['x02-g8', 'x2-y7', 'x02-y08', 'x8-y8']

== Features:

* sort case insensitive
* sort filename matching pattern "abc1", "abc12", "abc2" in the correct order
* sort filename matching pattern "a1b2"
* sort underscore insensitive

== Install:

* sudo gem install naturalsort"&http://naturalsort.rubyforge.org/T@[ 