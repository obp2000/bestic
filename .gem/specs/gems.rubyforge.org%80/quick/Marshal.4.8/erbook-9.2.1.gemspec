u:Gem::Specification�["
1.3.5i"erbookU:Gem::Version["
9.2.1Iu:	TimeHj�    :@marshal_with_utc_coercionF"1Write books, manuals, and documents in eRubyU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:runtime:@version_requirement0:
@name"
ember:@version_requirementsU;[[["~>U; ["0o;		;
;;0;"maruku;U;[[["~>U; ["0.5o;		;
;;0;"coderay;U;[[[">=U; ["0.8o;		;
;;0;"	haml;U;[[[">=U; ["
2.2.2o;		;
;;0;"mime-types;U;[[[">=U; ["	1.16o;		;
;;0;"	json;U;[[[">=U; ["0o;		;
:development;0;"inochi;U;[[["~>U; ["1o;		;
;;0;"inochi;U;[[["~>U; ["1"sunaku"sunaku@gmail.com["Suraj N. Kurapati"�                           ERBook 9.2.1

           Write books, manuals, and documents in eRuby

               http://snk.tuxfamily.org/lib/erbook/

   ERBook is an extensible document processor that emits [1]any
   document you can imagine from [2]eRuby templates, which allow
   scripting and dynamic content generation.

Version 9.2.1 (2009-11-18)

   This release fixes some bugs in, and improves the readability
   and load time of, generated XHTML documents.

   Bug fixes

     * Prevent search button from starting search when search
       box untouched.

     * Prevent browser from fetching base-64 embedded URI
       sources by qualifying their digests with the "cid" URI
       schema, which is used to identify the parts of a
       multi-part e-mail message.
       This cuts down on the amount of "404 - File Not Found"
       errors on the web server which hosts your generated XHTML
       documents because web browsers will not confuse these
       embedded "cid" digests as being relative HTTP files.

   Housekeeping

     * Increase vertical spacing between [3]References for
       better readability.

     * Embed W3C validator badges as base-64 data URIs to reduce
       page load time.

     * Split the document processing code in ERBook::Document
       into smaller self-documenting methods.

References

   1. http://snk.tuxfamily.org/lib/erbook/#HelloWorld
   2. http://en.wikipedia.org/wiki/ERuby
   3. http://snk.tuxfamily.org/lib/erbook/#_references
")http://snk.tuxfamily.org/lib/erbook/T@[ 