u:Gem::Specificationw["
1.3.6i"subloadU:Gem::Version["
1.1.0Iu:	Time ��    :@marshal_with_utc_coercionF"CA handy dandy autoload / require / load helper for your rubiesU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[	o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
1.0.0:
@type:development:@requirement@ :@prereleaseF:
@name"hoe-doofuso;	
;
U;[[[">=U; ["
1.3.0;;;@*;F;"hoe-gito;	
;
U;[[[">=U; ["
1.0.0;;;@4;F;"hoe-gemcuttero;	
;
U;[[[">=U; ["
2.3.3;;;@>;F;"hoe"libraggi["raggi@rubyforge.org["James Tucker"A handy dandy autoload / require / load helper for your rubies. Similar to
using[1], but with a few differences of opinion, and a bit shorter.

Basically, expand path is fine, up until a point. Sometimes there's no point
(i.e. when the load path already contains most of the path you're trying to
open). When you're writing libs that users might require sub parts with
'libname/sub_part', then expand_path combined with say, rubygems, can lead to
double requires. Lets not do that. :-)

[1] http://github.com/smtlaissezfaire/using/"%http://rubygems.org/gems/subloadT@[ 