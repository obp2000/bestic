u:Gem::Specificationd["
1.3.7i"n8-attr_encryptedU:Gem::Version["
1.1.3u:	TimeE��    "OGenerates attr_accessors that encrypt and decrypt attributes transparentlyU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
1.1.1:
@name"eigenclass:@requirement@ :@prereleaseF:
@type:runtimeo;
;	U;[[[">=U; ["
1.1.0;
"encryptor;@*;F;;o;
;	U;[[[">=U; ["
0.9.8;
"
mocha;@4;F;;0"shuber@huberry.com["Sean Huber"KGenerates attr_accessors that encrypt and decrypt attributes transparently. A fork with a kludge to handle :if/:unless Procs with attr_encrypted that uses attributes that may have not been set yet before the original attr_encrypted does its thing. This basically just resaves all the encrypted_attributes in a before_save callback.",http://github.com/shuber/attr_encryptedT@[ 