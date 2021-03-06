u:Gem::Specification�["
1.3.5i"activefactsU:Gem::Version["
0.8.6Iu:	Time��    :@marshal_with_utc_coercionF"aA semantic modeling and query language (CQL) and application runtime (the Constellation API)U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:@version_requirementsU;[[[">=U; ["
1.4.1:
@type:runtime:@version_requirement0:
@name"treetopo;		;
U;[[[">=U; ["
1.5.2;:development;0;"newgemo;		;
U;[[[">=U; ["
2.3.3;;;0;"hoe"cjheath@rubyforge.org["cjh@dataconstellation.org["Clifford Heath"�
ActiveFacts is a semantic modeling toolkit, comprising an implementation
of the Constellation Query Language, the Constellation API, and code
generators that receive CQL or ORM (Object Role Modeling files, from
NORMA) to emit CQL, Ruby and SQL.

Semantic modeling is a refinement of fact-based modeling techniques
that draw on natural language verbalisation and formal logic. Fact
based modeling is essentially the same as relational modeling in the
sixth normal form. The tools provided here automatically condense
that to third normal form for efficient storage. They also generate
object models as a Ruby module which has an effective mapping to
both the original semantic model and to the generated SQL.

The result is a formal language that reads like plain English, and
allows creation of relational and object models that are guaranteed
equivalent, and much more stable in the face of schema evolution than
SQL is.
".http://dataconstellation.com/ActiveFacts/T@[ 