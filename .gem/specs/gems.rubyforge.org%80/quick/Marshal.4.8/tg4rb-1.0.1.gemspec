u:Gem::Specification^["
0.9.4i"
tg4rbU:Gem::Version["
1.0.1Iu:	Time���    :@marshal_with_utc_coercionF"A recorder for FireWatirU:Gem::Requirement[[[">U; ["
0.0.00"	ruby[o:Gem::Dependency:@version_requirement0:
@name"hoe:@version_requirementsU;[[[">=U; ["
1.3.0"firewatir-gen"helder@gmail.com["Helder Ribeiro" == FEATURES:  * takes an XML with actions from tg4w and outputs stand-alone Ruby code that can be run directly or embedded into existing code (e.g. for test automation). * can be used as a library or as an executable script. * takes the xpath from tg4w and uses only enough info to guarantee the uniqueness of the referenced element, allowing the generated script to keep working even with some change to page structure.  == PROBLEMS:  * the generated code is damn ugly. * a few action types from the XML input still aren't recognized. * some dependencies aren't very clearly sorted out yet. you might find you need something that is not specified. if yes, please report this as an issue in our issue tracker. * i don't know, find more and let me know =)  == SYNOPSIS:"    by Helder RibeiroT@0