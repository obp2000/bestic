u:Gem::Specification�["
1.3.5i"	rlsmU:Gem::Version["
1.1.0Iu:	Timee�    :@marshal_with_utc_coercionF"GLibrary for investigating regular languages and syntactic monoids.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:development:@version_requirement0:@version_requirementsU;[[[">=U; ["0:
@name"minitesto;		;
;;0;U;[[[">=U; ["0;"thoughtbot-shoulda"	rlsm"g.diemant@gmx.net["Gunther Diemant"�= rlsm
rlsm stands for *R*egular *L*anguages and *S*yntactic *M*onoids.

Source is availible from
  http://github.com/asmodis/rlsm

RDoc-Documentation is availible from
  http://rlsm.rubyforge.org

== DESCRIPTION:

This is a ruby implementation of three concepts:
 - Deterministic Finite Automata
 - Regular Expressions (in the sense of theoretical computer sience)
 - Monoids


== SYNOPSIS:

  require 'rlsm'

  m = RLSM::Monoid.new '012 112 212'
  m.syntactic? # =&gt; true
  m.isomorph_to?(m) # =&gt; true
  m.commutative? # =&gt; false

== INSTALL:

  gem install rlsm 


== LICENSE:

(The MIT License)

Copyright (c) 2009 Gunther Diemant &lt;g.diemant@gmx.net&gt;

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

"#http://github.com/asmodis/rlsmT@[ 