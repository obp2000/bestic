u:Gem::Specifications["
1.3.5i"	echoU:Gem::Version["
0.0.0Iu:	Time�f�    :@marshal_with_utc_coercionF".An API test proxy that learns and repeatsU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:development:@version_requirement0:@version_requirementsU;[[[">=U; ["
1.2.9:
@name"
rspeco;		;
;;0;U;[[[">=U; ["0;"	yardo;		;
;;0;U;[[[">=U; ["0;"cucumber0"sfeley@gmail.com["Stephen Eley"�Echo is a test double for API interactions that learns from the real API. In its simplest use case, it extends Net::HTTP and tracks every HTTP call to a registered domain. If it hasn't seen that call, it stores both the request and the response. On subsequent calls it returns the stored response. Explicit scenario start/end markers are also supported for more complex multiple-step interactions.""http://github.com/SFEley/echoT@[ 