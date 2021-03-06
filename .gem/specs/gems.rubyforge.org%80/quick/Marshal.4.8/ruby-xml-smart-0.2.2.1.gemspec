u:Gem::SpecificationT["
1.3.5i"ruby-xml-smartU:Gem::Version["0.2.2.1Iu:	Time�o�    :@marshal_with_utc_coercionF"+easy to use and stable libxml2 bindingU:Gem::Requirement[[[">=U; ["
1.8.6U;[[[">=U; ["0"	ruby[ "ruby-xml-smart"!juergen.mangler@univie.ac.at["J&#252;rgen Mangler" == XML::Smart - A Ruby class for fast and simple XML access

Copyright (C) 2004-2007 J&#252;rgen Mangler &lt;juergen.mangler@univie.ac.at&gt;

Ruby/XML/Smart is freely distributable according to the terms of the
GNU Lesser General Public License (see the file 'COPYING').

This program is distributed without any warranty. See the file
'COPYING' for details.

== Installation

* You need a least ruby 1.8.6
* You need a least rake 0.5.0
* a libxml version known to work is 1.6.28

The installation process is very simple:

* rake
* [become root]
* rake install

== Documentation

View the examples in the ./examples subdirectory. In the ./examples/Visualise subdirectory
you can find a simple XPath visualiser. Never try to mix this module with the old libxml
binding, or you will get nasty segfaults.

=== SYNOPSIS TO CHANGE A FILE ON THE DISK

  require 'xml/smart'

  XML::Smart.modify(File.dirname($0) + "/EXAMPLE.xml") { |doc|
    node = doc.find("/test/names").first
    node.add("test_node",{"attr" =&gt; 12}, "Muahaha")
    node.add("test_node", "Muahaha", {"attr" =&gt; 13})
    node.add("test_node", {"attr" =&gt; 14})
    node.add("test_node", "Muahaha")
    node.add("test_node")
  }  

=== SYNOPSIS TO QUERY A FILE

  require 'xml/smart'

  doc = XML::Smart.open(File.dirname($0) + "/EXAMPLE.xml")

  node = doc.find("/test/names").first
  node.add("test_node",{"attr" =&gt; 12}, "Muahaha")
  node.add("test_node", "Muahaha", {"attr" =&gt; 13})
  node.add("test_node", {"attr" =&gt; 14})
  node.add("test_node", "Muahaha")
"5http://raa.ruby-lang.org/project/ruby-xml-smart/T@[ 