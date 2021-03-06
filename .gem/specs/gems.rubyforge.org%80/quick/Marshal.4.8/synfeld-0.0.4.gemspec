u:Gem::Specification�["
1.3.2i"synfeldU:Gem::Version["
0.0.4Iu:	Timede�    :@marshal_with_utc_coercionF"ISynfeld is a web application framework that does practically nothingU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:runtime:@version_requirement0:@version_requirementsU;[[[">=U; ["0:
@name"	racko;		;
;;0;U;[[[">=U; ["0;"rack-routero;		;
:development;0;U;[[[">=U; ["
2.5.1;"
bones"synfeld"sswerling@yahoo.com["Steven Swerling"�Synfeld is a web application framework that does practically nothing.

Synfeld is little more than a small wrapper for Rack::Mount (see http://github.com/josh/rack-mount). If you want a web framework that is mostly just going to serve up json blobs, and occasionally serve up some simple content (eg. help files) and media, Synfeld makes that easy. 

The sample app below shows pretty much everything there is to know about synfeld, in particular:

* How to define routes.
* Simple rendering of erb, haml, html, json, and static files.
* In the case of erb and haml, passing variables into the template is demonstrated.
* A dynamic action where the status code, headers, and body are created 'manually' (/my/special/route below)
* A simple way of creating format sensitive routes (/alphabet.html vs. /alphabet.json)
* The erb demo link also demos the rendering of a partial (not visible in the code below, you have to look at the template file examples/public/erb_files/erb_test.erb)."http://tab-a.slot-z.netT@[ 