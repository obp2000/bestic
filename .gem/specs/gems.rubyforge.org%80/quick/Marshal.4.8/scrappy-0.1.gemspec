u:Gem::Specification}["
1.3.6i"scrappyU:Gem::Version["0.1u:	Time֤�    "FWeb scraper that allows producing RDF data out of plain web pagesU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
2.3.5:
@name"activesupport:@requirement@ :@prereleaseF:
@type:runtimeo;
;	U;[[[">=U; ["
0.7.1;
"markaby;@*;F;;o;
;	U;[[["=U; ["2.0;
"camping;@4;F;;o;
;	U;[[[">=U; ["
1.4.1;
"nokogiri;@>;F;;o;
;	U;[[[">=U; ["
1.0.0;
"mechanize;@H;F;;o;
;	U;[[[">=U; ["0.1;
"lightrdf;@R;F;;o;
;	U;[[[">=U; ["
2.0.4;
"rubyforge;@\;F;:developmento;
;	U;[[[">=U; ["
2.6.0;
"hoe;@f;F;;"scrappy["$joseignacio.fernandez@gmail.com["Jose Ignacio"TScrappy is a tool that allows extracting information from web pages and producing RDF data.
It uses the scraping ontology to define the mappings between HTML contents and RDF data.

An example of mapping is shown next, which allows extracting all titles from http://www.elmundo.es:

  dc: http://purl.org/dc/elements/1.1/
  rdf: http://www.w3.org/1999/02/22-rdf-syntax-ns#
  sioc: http://rdfs.org/sioc/ns#
  sc: http://lab.gsi.dit.upm.es/scraping.rdf#
  *:
    rdf:type: sc:Fragment
    sc:selector:
      *:
        rdf:type: sc:UriSelector
        rdf:value: "http://www.elmundo.es/"
    sc:identifier:
      *:
        rdf:type: sc:BaseUriSelector
    sc:subfragment:
      *:
        sc:type: sioc:Post
        sc:selector:
          *:
            rdf:type: sc:CssSelector
            rdf:value: ".noticia h2, .noticia h3, .noticia h4"
        sc:identifier:
          *:
            rdf:type: sc:CssSelector
            rdf:value: "a"
            sc:attribute: "href"
        sc:subfragment:
          *:
            sc:type:     rdf:Literal
            sc:relation: dc:title
            sc:selector:
              *:
                rdf:type:  sc:CssSelector
                rdf:value: "a"

(The above code is serialized using YARF format, supported by LightRDF gem, as well as
RDFXML, JSON, NTriples formats, which can also be used to define the mappings)."$http://github.com/josei/scrappyT@[ 