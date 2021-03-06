u:Gem::SpecificationI["
1.3.5i"drnic-liquidU:Gem::Version["
2.1.0Iu:	Time�_�    :@marshal_with_utc_coercionF"HA secure non evaling end user template engine with aesthetic markupU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:development:@version_requirement0:@version_requirementsU;[[[">=U; ["
2.3.3:
@name"hoe"liquid["tobi@leetsoft.com["Tobias Luetke"�A secure non evaling end user template engine with aesthetic markup.

Liquid is a template engine which I wrote for very specific requirements.

* It has to have beautiful and simple markup. 
  Template engines which don't produce good looking markup are no fun to use. 
* It needs to be non evaling and secure. Liquid templates are made so that users can edit them. You don't want to run code on your server which your users wrote. 
* It has to be stateless. Compile and render steps have to be seperate so that the expensive parsing and compiling can be done once and later on you can 
  just render it   passing in a hash with local variables and objects." http://www.liquidmarkup.orgT@[ 