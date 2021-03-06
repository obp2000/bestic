u:Gem::Specification%["
1.3.6i"view_modelsU:Gem::Version["
1.5.7Iu:	Time֍�    :@marshal_with_utc_coercionF"oA model proxy for Rails views. Helps you keep the representation of a model and the model itself separate.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
2.2.0:@prereleaseF:
@type:runtime:@requirement@ :
@name"
railso;	
;
U;[[[">=U; ["
1.2.9;F;:development;@*;"
rspec0"florian.hanke@gmail.com[	"Florian Hanke"Kaspar Schiess"Niko Dittmann"Andreas Schacke"�The view models gem adds the missing R (Representation) to Rails' MVC. It provides simple proxy functionality for your models and thus helps you keep the model and view representations of a model separate, as it should be. Also, you can define helper methods on the (view) model instead of globally to keep them focused, more quickly understood and more easily testable. View Models also introduce hierarchical rendering for your hierarchical models. If the account view is not defined for the subclass FemaleUser, it checks if it is defined for User, for example, to see when there is no specific view, if there is a general view. So, in other words: Polymorphism not just in the model, but also in the view. Have fun!")http://floere.github.com/view_modelsT@[ 