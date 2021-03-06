u:Gem::Specification["
1.3.5i"StencilU:Gem::Version["
0.1.1Iu:	Time���    :@marshal_with_utc_coercionF"&Output agnostic templating engineU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[ "stencil-templ"nyarly@gmail.com["Judson Lester"�  Stencil is a templating library with a number of design goals.

  *  Limited code in templates.  This isn't meant to embed ruby in anything - 
  it allows for simple control structures, since that's typically what you need 
  in a template, but full access to the Ruby
  interpreter is just a tempatation into sin. (From a separation of concerns 
  standpoint.)  There's a certain amount of code available in conditionals and 
  interpolations, since otherwise they're much harder to do...

  *  Easy to extend.  If you do need something extra from a template, not 
  having it in the templating language is frustrating.  It's easy to add 
  features to stencil, since they're described in as well-designed classes.

  * Generic output.  Not everything is a website or a mime-encoded email.  It's 
  nice to be able to spit out generic text from time to time.

  * Data sourced from simple datatypes - hashes and array, referenced with data 
  paths.  Views can be extracted from any object, or built up in code.
"(http://stencil-templ.rubyforge.org/T@[ 