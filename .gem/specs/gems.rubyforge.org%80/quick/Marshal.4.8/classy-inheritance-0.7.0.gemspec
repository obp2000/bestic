u:Gem::Specification["
1.3.1i"classy-inheritanceU:Gem::Version["
0.7.0Iu:	TimedM�    :@marshal_with_utc_coercionF"zClassy Inheritance adds a depends_on class method to your ActiveRecord model so that you can define requisite objectsU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:development:@version_requirement0:
@name"
bones:@version_requirementsU;[[[">=U; ["
2.4.2"classyinherit"andy@stonean.com["Andrew Stone"Classy Inheritance adds a depends_on class method to your ActiveRecord model so that you can define requisite objects.  This functionality is provided using the existing ActiveRecord methods without monkey patching any core code. Essentially, it provides an easy interface to generate code that anyone could add to their model to receive the same result. Depending on the parameters to your depends_on call, it may add some of the following methods: validates_presence_of, validates_associated, has_one or belongs_to."/http://stonean.com/wiki/classy-inheritanceT@0