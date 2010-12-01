u:Gem::Specification�["
1.3.1i"rubysspiU:Gem::Version["
1.3.1Iu:	Time�C�    :@marshal_with_utc_coercionF"�A library which implements Ruby bindings to the Win32 SSPI library. Also includes a module to add Negotiate authentication support to Net::HTTP.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[ ",http://rubyforge.org/projects/rubysspi/" jgbailey @nospam@ gmail.com["Justin Bailey"�This gem provides bindings to the Win32 SSPI libraries, primarily to support Negotiate (i.e. SPNEGO, NTLM) authentication with a proxy server. Enough support is implemented to provide the necessary support for the authentication.  A module is also provided which overrides Net::HTTP and adds support for Negotiate authentication to it.  This implies that open-uri automatically gets support for it, as long as the http_proxy environment variable is set.",http://rubyforge.org/projects/rubysspi/T@0