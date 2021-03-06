u:Gem::Specificationm["
1.3.6i"ParseTreeU:Gem::Version["
3.0.5Iu:	Timeg��    :@marshal_with_utc_coercionF"�ParseTree is a C extension (using RubyInline) that extracts the parse tree for an entire class or a specific method and returns it as a s-expression (aka sexp) using ruby's arrays, strings, symbols, and integersU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[
o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
3.7.0:
@type:runtime:@requirement@ :@prereleaseF:
@name"RubyInlineo;	
;
U;[[[">=U; ["
3.0.0;;;@*;F;"sexp_processoro;	
;
U;[[[">=U; ["
2.0.4;:development;@4;F;"rubyforgeo;	
;
U;[[[">=U; ["
1.6.0;;;@>;F;"minitesto;	
;
U;[[[">=U; ["
2.6.0;;;@H;F;"hoe"parsetree["ryand-ruby@zenspider.com["Ryan Davis"%ParseTree is a C extension (using RubyInline) that extracts the parse
tree for an entire class or a specific method and returns it as a
s-expression (aka sexp) using ruby's arrays, strings, symbols, and
integers.

As an example:

  def conditional1(arg1)
    if arg1 == 0 then
      return 1
    end
    return 0
  end

becomes:

  [:defn,
    :conditional1,
    [:scope,
     [:block,
      [:args, :arg1],
      [:if,
       [:call, [:lvar, :arg1], :==, [:array, [:lit, 0]]],
       [:return, [:lit, 1]],
       nil],
      [:return, [:lit, 0]]]]]"-http://rubyforge.org/projects/parsetree/T@[ 