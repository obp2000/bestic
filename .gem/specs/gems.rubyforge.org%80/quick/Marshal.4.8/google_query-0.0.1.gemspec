u:Gem::Specification�["
0.9.3i"google_queryU:Gem::Version["
0.0.1Iu:	Time���    :@marshal_with_utc_coercionF"LUses Google to get currency conversion, world time and human populationU:Gem::Requirement[[[">U; ["
0.0.00"	ruby[o:Gem::Dependency:@version_requirement0:
@name"hpricot:@version_requirementsU;[[["=U; ["0.6o;	;
0;"hoe;U;[[[">=U; ["
1.2.2"googlequery"ben.schwarz@gmail.com["Ben Schwarz"�== SYNOPSIS:  require 'rubygems' require 'google_query'  # See how you get spanked by the pound GoogleQuery::Currency.get 'AUD to GBP' =&gt; 1 U.S. dollar = 0.490484599 British pounds  # Get population in Melbourne GoogleQuery::Population.get 'melbourne' =&gt; Population: 3,850,000 (Est.) (2nd)  # Get the current time in London GoogleQuery::Time.get 'london' =&gt; 2:26 PM on Monday, July 30  # On the command line: bens-pb:~ ben$ gpop melbourne"http://germanforblack.com/T@0