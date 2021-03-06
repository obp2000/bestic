u:Gem::Specification["
1.3.5i"antlr3U:Gem::Version["
1.8.0Iu:	Time���    :@marshal_with_utc_coercionF"?Fully-featured ruby parser generation for ANTLR version 3.U:Gem::Requirement[[[">=U; ["
1.8.7U;[[[">=U; ["0"	ruby[ "antlr3"kcy5b@yahoo.com["Kyle Yetter"�Fully-featured ANTLR 3 parser generation for Ruby.

ANTLR (ANother Tool for Language Recognition) is a tool that is used to generate
code for performing a variety of language recognition tasks: lexing, parsing,
abstract syntax tree construction and manipulation, tree structure recognition,
and input translation. The tool operates simillarly to other parser generators,
taking in a grammar specification written in the special ANTLR metalanguage and
producing source code that implements the recognition functionality.

While the tool itself is implemented in Java, it has an extensible design that
allows for code generation in other programming languages. To implement an
ANTLR language target, a developer may supply a set of templates written in the
StringTemplate (http://www.stringtemplate.org) language.

ANTLR is currently distributed with a fairly limited Ruby target implementation.
While it does provide implementation for basic lexer and parser classes, the
target does not provide any implementation for abstract syntax tree
construction, tree parser class generation, input translation, or a number of
the other ANTLR features that give the program an edge over traditional code
generators.

This gem packages together a complete implementation of the majority of features
ANTLR provides for other language targets, such as Java and Python. It contains:

* A customized version of the latest ANTLR program, bundling all necessary
  java code and templates for producing fully featured language recognition
  in ruby code

* a ruby runtime library that collects classes used throughout the code that
  ANTLR generates

* a wrapper script, `antlr4ruby', which executes the ANTLR command line tool
  after ensuring the ANTLR jar is java's class path".http://www.ohboyohboyohboy.org/ruby-antlrT@[ 