u:Gem::Specifications["
1.3.6i"maptp-serviceU:Gem::Version["
0.0.2Iu:	Time֒�    :@marshal_with_utc_coercionF"7This gem provides access to the MapTP web servicesU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
0.7.6:@prereleaseF:
@type:runtime:@requirement@ :
@name"
savono;	
;
U;[[[">=U; ["
2.0.4;F;:development;@*;"rubyforgeo;	
;
U;[[[">=U; ["
2.6.0;F;;;@4;"hoe"maptp-service["christian@ffwdme.com["Christian B&#228;uerlein"[This gem provides access to the MapTP web services.

In order to use them, you need your MapTP credentials aka your Map24 id.

For more information head over to http://www.nn4d.com

You should consider that this client solely works with WGS&#180;84 coordinates in the Decimal Degrees format.
Usually MapTP services work with the Decimal Minutes format, but because Decimal Degrees are much more
established we use it for this lib. To work with MapTP the parameters as well as the responses are
converted internally.

*Note*: This is *not* an official client of MapTP or NAVTEQ, but a private project. :)0T@[ 