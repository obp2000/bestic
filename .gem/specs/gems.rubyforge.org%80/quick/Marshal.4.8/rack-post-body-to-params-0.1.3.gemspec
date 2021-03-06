u:Gem::SpecificationE["
1.3.7i"rack-post-body-to-paramsU:Gem::Version["
0.1.3Iu:	Time���    :@marshal_with_utc_coercionF"jA Rack middleware that parses the POST or PUT body for JSON or XML content to a Hash and puts it into the rack.request.form_hash. Most frameworks get the params hash from there. Uses ActiveSupport and the respective parsers for parsing. So you can set it up to use Nokogiri and YajL. Useful for example when writing JSON and XML API apps with Sinatra or Padrino.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["0:@prereleaseF:
@type:development:@requirement@ :
@name"shouldao;	
;
U;[[[">=U; ["2.3;F;:runtime;@*;"activesupport0"mail+git@niko-dittmann.com["Niko Dittmann" "4http://github.com/niko/rack-post-body-to-paramsT@[ 