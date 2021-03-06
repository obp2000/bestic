u:Gem::SpecificationV["
0.9.4i"acts_as_wrapped_classU:Gem::Version["
1.0.1Iu:	Time'��    :@marshal_with_utc_coercionF"oautomatically generate wrapper classes which restrict access to methods and constants in the wrapped classU:Gem::Requirement[[[">U; ["
0.0.00"	ruby[o:Gem::Dependency:@version_requirement0:
@name"hoe:@version_requirementsU;[[[">=U; ["
1.3.0"wrapped-class"ds@elctech.com["David Stevenson"�== FEATURES/PROBLEMS:  *  Wrappers do not dispatch const_missing yet, so constants are not accessible yet.  == SYNOPSIS:  class Something acts_as_wrapped_class :methods =&gt; [:safe_method] # SomethingWrapper is now defined  def safe_method  # allowed to access this method through SomethingWrapper Something.new end  def unsafe_method  # not allowed to access this method through SomethingWrapper end end"    by David Stevenson T@0