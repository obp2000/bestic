u:Gem::Specification`["
0.9.2i"metainspectorU:Gem::Version["
1.0.2Iu:	Time7��    :@marshal_with_utc_coercionF"�Ruby gem for web scraping purposes. It scrapes a given URL, and returns you a hash with data from it like for example the title, meta description, meta keywords, an array with all the links, all the images in it, etc.U:Gem::Requirement[[[">U; ["
0.0.00"	ruby[o:Gem::Dependency:@version_requirement0:
@name"hpricot:@version_requirementsU;[[[">U; ["
0.0.0o;	;
0;"hoe;U;[[[">=U; ["
1.3.0"metainspector"jaimeiniesta@gmail.com["Jaime Iniesta"== FEATURES/PROBLEMS:  * Scrape a given URL and return data from its HTML  == SYNOPSIS:  # Require all gems and libs needed... require 'rubygems' require 'open-uri' require 'hpricot' require 'metainspector'  # Scrape an URL... page_data = MetaInspector.scrape(url)"    by Jaime IniestaT@0