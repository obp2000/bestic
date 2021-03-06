u:Gem::SpecificationN["
1.3.6i"ParseTreeU:Gem::Version["
3.0.6u:	Time' €    "ÓParseTree is a C extension (using RubyInline) that extracts the parse tree for an entire class or a specific method and returns it as a s-expression (aka sexp) using ruby's arrays, strings, symbols, and integersU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[
o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
3.7.0:
@name"RubyInline:@requirement@ :@prereleaseF:
@type:runtimeo;
;	U;[[[">=U; ["
3.0.0;
"sexp_processor;@*;F;;o;
;	U;[[[">=U; ["
2.0.4;
"rubyforge;@4;F;:developmento;
;	U;[[[">=U; ["
1.6.0;
"minitest;@>;F;;o;
;	U;[[[">=U; ["
2.6.0;
"hoe;@H;F;;"parsetree["ryand-ruby@zenspider.com["Ryan Davis"%ParseTree is a C extension (using RubyInline) that extracts the parse
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