u:Gem::Specification`["
1.3.6i"
mms2rU:Gem::Version["
3.1.0Iu:	Time'��    :@marshal_with_utc_coercionF"8Extract user media from MMS (and not carrier cruft)U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
1.4.0:@prereleaseF:
@type:runtime:@requirement@ :
@name"nokogirio;	
;
U;[[[">=U; ["
2.2.5;F;;;@*;"	mailo;	
;
U;[[[">=U; ["
2.1.1;F;;;@4;"uuidtoolso;	
;
U;[[[">=U; ["
1.0.1;F;;;@>;"
exifro;	
;
U;[[[">=U; ["
2.0.3;F;:development;@H;"rubyforgeo;	
;
U;[[[">=U; ["
0.4.1;F;;;@R;"gemcuttero;	
;
U;[[[">=U; ["
2.5.0;F;;;@\;"hoe"
mms2r["mikemondragon@gmail.com["Mike Mondragon"k== DESCRIPTION

MMS2R is a library that decodes the parts of an MMS message to disk while
stripping out advertising injected by the mobile carriers.  MMS messages are
multipart email and the carriers often inject branding into these messages.  Use
MMS2R if you want to get at the real user generated content from a MMS without
having to deal with the cruft from the carriers.

If MMS2R is not aware of a particular carrier no extra processing is done to the
MMS other than decoding and consolidating its media.

MMS2R can be used to process any multipart email to conveniently access the
parts the mail is comprised of."!http://mms2r.rubyforge.org/
T@[ 