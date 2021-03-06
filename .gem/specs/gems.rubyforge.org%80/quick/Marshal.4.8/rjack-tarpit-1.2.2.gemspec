u:Gem::Specificationb["
1.3.6i"rjack-tarpitU:Gem::Version["
1.2.2Iu:	Time��    :@marshal_with_utc_coercionF"@TarPit provides the glue for an unholy union of build toolsU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[["~>U; ["2.4:@prereleaseF:
@type:runtime:@requirement@ :
@name"	rdoco;	
;
U;[[["~>U; ["
1.0.3;F;;;@*;"rubyforgeo;	
;
U;[[["~>U; ["
2.3.3;F;;;@4;"hoe"
rjack["dek-oss@gravitext.com["David Kellum"HTarPit provides the glue for an unholy union of build tools. Namely:

* Rake[http://github.com/jimweirich/rake] with
  Hoe[http://seattlerb.rubyforge.org/hoe/] for gem publishing
* Maven[http://maven.apache.org/] for Java builds with dependencies.

In particular, it runs "mvn package" when needed, links jars to the
gem lib directory, and provides (semi-)automatic Manifest.txt
generation with these jar files without offending Hoe.

* The Maven pom.xml (and assembly.xml if needed) must be managed
  independently.
* A Manifest.static file holds the static elements of the manifest."http://rjack.rubyforge.orgT@[ 